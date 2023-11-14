import 'dart:async';

import 'package:atest/login/uverification_code.dart';
import 'package:atest/sp/sp_utils.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../generated/l10n.dart';
import '../network/api.dart';
import '../network/user.dart';

class LoginPopup extends StatefulWidget {
  @override
  _LoginPopupState createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final verificationCodeKey = GlobalKey<UVerificationCodeState>();

  bool showLogin = false;
  int loginType = 2; //1登录，2注册，3忘记密码
  String codeTips = 'Get Code';
  String codeImage = '';
  int loginStatus = 1;
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPwdController = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  String email = '892537848@qq.com';
  String code = '';
  String password = '';
  String againPwd = '';
  String captcha = '';

  void toggleLogin() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  void changeLoginType(int type) {
    setState(() {
      loginType = type;
    });
  }

  void getCode(GlobalKey<UVerificationCodeState> verificationCodeKey) {
    String type = '';
    email = '892537848@qq.com';
    if (email.isEmpty) {
      errorToShow('Please enter your email');
      return;
    }
    if (loginType == 2) {
      type = '1';
    }
    if (loginType == 3) {
      type = '2';
    }
    if (verificationCodeKey?.currentState?.canGetCode == true) {
      ApiClient().userSms({"email": email, "type": type}).then((res) {
        print('执行到这了');
        CommonUtils.toast(res['msg']);
        verificationCodeKey.currentState?.start();
        print('执行到这了33');
      }).catchError((err) {
        // Handle error
        print('执行到这了22' + err.toString());
        err.toString();
      });
    } else {
      CommonUtils.toast('The countdown ends before sending');
    }
  }

  void getcodeimage() {
    ApiClient().sendCaptcha({}).then((res) {
      if (res['status']) {
        setState(() {
          this.codeImage = res['data']['captcha_image'];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void submit() {
    var data = {
      "code": code,
      "email": email,
      "password": password,
      "captcha": captcha, //图形验证
      "again_pwd": againPwd
    };
    if (email.isEmpty) {
      errorToShow('Please enter your email');
      return;
    }
    if (password.isEmpty) {
      return errorToShow('Please enter your password');
    }
    if (captcha.isEmpty) {
      return errorToShow('Please enter the captcha');
    }

    if (loginType == 2) {
      // 注册
      if (againPwd.isEmpty) {
        return errorToShow('Please confirm your login password');
      }
      if (againPwd != password) {
        return errorToShow('Inconsistent input, please confirm');
      }
      ApiClient().login(data).then((res) {
        SPUtils.setString('token', res.data);
        successToShow('Login succeeded');
        // await ApiClient().userInfo();
        Timer(Duration(milliseconds: 800), () {
          loginType = 1;
          showLogin = false;
        });
      });
    } else if (loginType == 1) {
      // 密码登录
      ApiClient().passwordlogin(data).then((res) {
        SPUtils.setString('token', res.data);
        successToShow('Sign succeeded');
        // await ApiClient().userInfo();
        Timer(Duration(milliseconds: 800), () {
          loginType = 1;
          showLogin = false;
        });
      });
    } else if (loginType == 3) {
      // 找回密码
      if (againPwd != password) {
        return errorToShow('Inconsistent input, please confirm');
      }
      ApiClient().forgetpwd(data).then((res) {
        successToShow('Plase sign');
        Timer(Duration(milliseconds: 800), () {
          loginType = 1;
          showLogin = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 691.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 31.h,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          showLogin = false;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(left: 47.w),
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getHeaderContainer(localizations),
                      SizedBox(
                        height: 100.h,
                      )
                    ])),
            SizedBox(height: 37.h),
            Padding(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              child: TextField(
                style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                controller: emailController,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),
            ),
            if (loginType == 2 || loginType == 3) SizedBox(height: 37.h),
            if (loginType == 2 || loginType == 3)
              Container(
                height: 88.h,
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 88.h,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 24.sp, color: Color(0xff666666)),
                        controller: codeController,
                        onChanged: (value) {
                          setState(() {
                            code = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: localizations.plsEmailCode,
                        ),
                      ),
                    ),
                    SizedBox(width: 26.w),
                    Container(
                      height: 88.h,
                      child: GestureDetector(
                        child: UVerificationCode(key: verificationCodeKey),
                        onTap: () {
                          getCode(verificationCodeKey);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 37.h),
            Container(
                height: 88.h,
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: TextField(
                  style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: localizations.enterPwd,
                  ),
                )),
            if (loginType == 2 || loginType == 3) SizedBox(height: 37.h),
            Container(
                height: 88.h,
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: TextField(
                  controller: againPwdController,
                  onChanged: (value) {
                    setState(() {
                      againPwd = value;
                    });
                  },
                  style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password Again',
                  ),
                )),
            SizedBox(height: 37.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 88.h,
                    child: TextField(
                      style:
                      TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                      controller: captchaController,
                      onChanged: (value) {
                        setState(() {
                          captcha = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: localizations.plsCapcha,
                      ),
                    )),
                GestureDetector(
                  onTap: getcodeimage,
                  child: Builder(builder: (context) {
                    if (codeImage.isNotEmpty) {
                      return CachedNetworkImage(
                          imageUrl: codeImage, height: 87.h, width: 181.w);
                    } else {
                      return Container();
                    }
                  }),
                )
              ],
            ),
            SizedBox(height: 37.h),
            if (loginType == 2)
              Container(
                  height: 30,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => changeLoginType(1),
                        child: Text(localizations.logIn,
                            style: TextStyle(
                                color: Color(0xff072D8C), fontSize: 24.sp)),
                      ),
                      GestureDetector(
                        onTap: () => changeLoginType(3),
                        child: Text(localizations.str17,
                            style: TextStyle(
                                color: Color(0xff072D8C), fontSize: 24.sp)),
                      ),
                    ],
                  ))
            else if (loginType == 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => changeLoginType(2),
                    child: Text(localizations.signUp),
                  ),
                  GestureDetector(
                    onTap: () => changeLoginType(3),
                    child: Text('Forgot Password'),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => changeLoginType(1),
                    child: Text('Login'),
                  ),
                  GestureDetector(
                    onTap: () => changeLoginType(2),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            GestureDetector(
              onTap: submit,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(10),
                child: Text(
                  loginType == 2
                      ? 'Sign Up'
                      : (loginType == 1 ? 'Login' : 'Submit'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column getForgetHeaderContainer(S localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.changePassword,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36.sp,
          ),
        ),
        Text(localizations.str16),
      ],
    );
  }

  Column getSignUpHeaderContainer(S localizations) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.signUp,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36.sp,
          ),
        ),
        Text(localizations.str16),
      ],
    );
  }

  void successToShow(String s) {}

  Widget getSignInHeaderContainer(localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.logIn,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36.sp,
          ),
        ),
        Text(localizations.str16),
      ],
    );
  }

  getHeaderContainer(S localizations) {
    switch (loginType) {
      case 1:
        return getSignInHeaderContainer(localizations);
      case 2:
        return getSignUpHeaderContainer(localizations);
      case 3:
        return getForgetHeaderContainer(localizations);
      default:
        return getSignInHeaderContainer(localizations);
    }
  }
}
