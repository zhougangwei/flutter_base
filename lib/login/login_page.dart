import 'package:abce/login/uverification_code.dart';
import 'package:abce/utils/sp_utils.dart';
import 'package:abce/utils/common_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../eventbus/eventbus.dart';
import '../generated/l10n.dart';
import '../network/user.dart';

class LoginPopup extends StatefulWidget {
  final VoidCallback? onLoginSuccess;

  LoginPopup({this.onLoginSuccess});

  @override
  _LoginPopupState createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final verificationCodeKey = GlobalKey<UVerificationCodeState>();

  bool showLogin = false;
  int loginType = 1; //1登录，2注册，3忘记密码
  String codeTips = 'Get Code';
  String codeImage = '';
  int loginStatus = 1;
  String email = '';
  String code = '';
  String password = '';
  late TextEditingController emailController;
  TextEditingController codeController = TextEditingController();
  late TextEditingController passwordController;
  TextEditingController againPwdController = TextEditingController();
  TextEditingController captchaController = TextEditingController();

  String againPwd = '';
  String captcha = '';

  void toggleLogin() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  void initState() {
    super.initState();
    if(SPUtils.getString('email').isNotEmpty){
      emailController = TextEditingController(text: SPUtils.getString('email'));
      email = SPUtils.getString('email');
    }else{
      emailController = TextEditingController();
    }
    if(SPUtils.getString('password').isNotEmpty){
      passwordController =
          TextEditingController(text: SPUtils.getString('password'));
      password = SPUtils.getString('password');
    }else{
      passwordController =
          TextEditingController();
    }


    getcodeimage();
  }

  void changeLoginType(int type) {
    setState(() {
      loginType = type;
    });
  }

  void getCode(GlobalKey<UVerificationCodeState> verificationCodeKey) {
    String type = '';
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
        toast(res['msg']);
        verificationCodeKey.currentState?.start();
        print('执行到这了33');
      }).catchError((err) {
        // Handle error
        print('执行到这了22' + err.toString());
        err.toString();
      });
    } else {
      toast('The countdown ends before sending');
    }
  }

  void getcodeimage() {
    ApiClient().sendCaptcha({}).then((res) {
      print('执行到这了' + res['status'].toString() + res['msg']);
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
      errorToShow('Please enter your password');
      return;
    }
    if (captcha.isEmpty) {
      errorToShow('Please enter the captcha');
      return;
    }

    if (loginType == 2) {
      // 注册
      if (againPwd.isEmpty) {
        errorToShow('Please confirm your login password');
        return;
      }
      if (againPwd != password) {
        errorToShow('Inconsistent input, please confirm');
        return;
      }
      ApiClient().login(data).then((res) {
        if (res['status']) {
          SPUtils.setString('token', res['data']);
          successToShow('Login succeeded');
          SPUtils.setString('email', email);
          SPUtils.setString('password', password);
          // await ApiClient().userInfo();
          loginType = 1;
          showLogin = false;
          widget.onLoginSuccess!();
        } else {
          errorToShow(res['msg']);
        }
      });
    } else if (loginType == 1) {
      // 密码登录
      ApiClient().passwordlogin(data).then((res) {
        if (res['status']) {
          SPUtils.setString('token', res['data']);
          successToShow('Sign succeeded');
          SPUtils.setString('email', email);
          SPUtils.setString('password', password);
          loginType = 1;
          showLogin = false;
          widget.onLoginSuccess!();
        } else {
          errorToShow(res['msg']);
        }
      });
    } else if (loginType == 3) {
      // 找回密码
      if (againPwd != password) {
        errorToShow('Inconsistent input, please confirm');
        return;
      }
      ApiClient().forgetpwd(data).then((res) {
        if (res['status']) {
          SPUtils.setString('token', res['data']);
          SPUtils.setString('email', email);
          SPUtils.setString('password', password);
          loginType = 1;
          showLogin = false;
          Navigator.of(context).pop();
          successToShow('Plase sign');
        } else {
          errorToShow(res['msg']);
        }
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 60.h,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: Colors.white,
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
            Container(
              height: 88.h,
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
                  hintText: localizations.plsEmail,
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
                    Expanded(
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
                  obscureText: true,
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
            if (loginType == 2 || loginType == 3)
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
                        hintText: localizations.entertPwsAgain),
                  )),
            SizedBox(height: 37.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  height: 88.h,
                  padding: EdgeInsets.only(left: 32.w, right: 27.w),
                  child: TextField(
                    style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
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
                  ),
                )),
                GestureDetector(
                  onTap: getcodeimage,
                  child: Builder(builder: (context) {
                    if (codeImage.isNotEmpty) {
                      return CachedNetworkImage(
                          imageUrl: codeImage, height: 87.h, width: 181.w);
                    } else {
                      return Container(
                          color: Colors.black, height: 87.h, width: 181.w);
                    }
                  }),
                ),
                SizedBox(width: 34.w)
              ],
            ),
            SizedBox(height: 37.h),
            if (loginType == 2)
              Container(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
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
              Container(
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => changeLoginType(2),
                      child: Text(localizations.signUp,
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
                ),
              )
            else
              Container(
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
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
                      onTap: () => changeLoginType(2),
                      child: Text(localizations.signUp,
                          style: TextStyle(
                              color: Color(0xff072D8C), fontSize: 24.sp)),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 40.h),
            Container(
              height: 75.h,
              margin: EdgeInsets.only(left: 32.w, right: 32.w, bottom: 70.h),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  submit();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    loginType == 2
                        ? localizations.signUp
                        : (loginType == 1
                            ? localizations.logIn
                            : localizations.submit),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void successToShow(String s) {
    print("successToShow" + s);
  }

  Widget getSignInHeaderContainer(title, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36.sp,
          ),
        ),
        SizedBox(height: 20.h),
        Text(content,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            )),
      ],
    );
  }

  getHeaderContainer(S localizations) {
    switch (loginType) {
      case 1:
        return getSignInHeaderContainer(
            localizations.logIn, localizations.str16);
      case 2:
        return getSignInHeaderContainer(
            localizations.signUp, localizations.str16);
      case 3:
        return getSignInHeaderContainer(
            localizations.changePassword, localizations.str16);
      default:
        return getSignInHeaderContainer(
            localizations.logIn, localizations.str16);
    }
  }
}
