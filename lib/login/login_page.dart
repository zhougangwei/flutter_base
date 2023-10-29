import 'package:atest/login/uverification_code.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../network/api.dart';
import '../network/user.dart';

class LoginPopup extends StatefulWidget {
  @override
  _LoginPopupState createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final verificationCodeKey = GlobalKey<UVerificationCodeState>();

  bool showLogin = false;
  int loginType = 2;
  String codeTips = 'Get Code';
  String codeImage = 'code_image_url';

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
      HttpClient().userSms({"email": email, "type": type}).then((res) {
        print('执行到这了');
        CommonUtils.toast(res['msg']);
        verificationCodeKey.currentState?.start();
        print('执行到这了33');

      }).catchError((err) {
        // Handle error
        print('执行到这了22'+err.toString());
        err.toString();
      });
    } else {
      CommonUtils.toast('The countdown ends before sending');
    }
  }

  void getcodeimage() {
    // implement your code to get code image
  }

  void submit() {
    // implement your code to submit login/signup form
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 280.0,
        height: 600.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                color: Colors.blue,
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
                height: 100,
                width: double.infinity,
                color: Colors.blue,
                child: Builder(builder: (BuildContext context) {
                  if (loginType == 2)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('Get assess'),
                      ],
                    );
                  else if (loginType == 3)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Text('str16'),
                      ],
                    );
                  else
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Text('str16'),
                      ],
                    );
                })),
            SizedBox(height: 10),
            TextField(
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
            if (loginType == 2 || loginType == 3) SizedBox(height: 10),
            if (loginType == 2 || loginType == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: codeController,
                        onChanged: (value) {
                          setState(() {
                            code = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email Code',
                        ),
                      )),
                  GestureDetector(
                    child: UVerificationCode(key: verificationCodeKey),
                    onTap: () {
                      getCode(verificationCodeKey);
                    },
                  ),
                ],
              ),
            SizedBox(height: 10),
            Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 0.0),
                child: TextField(
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                  ),
                )),
            if (loginType == 2 || loginType == 3) SizedBox(height: 10),
            if (loginType == 2 || loginType == 3)
              Container(
                  height: 40,
                  child: TextField(
                    controller: againPwdController,
                    onChanged: (value) {
                      setState(() {
                        againPwd = value;
                      });
                    },
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password Again',
                    ),
                  )),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 200,
                    child: TextField(
                      controller: captchaController,
                      onChanged: (value) {
                        setState(() {
                          captcha = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Captcha',
                      ),
                    )),
                GestureDetector(
                    onTap: getcodeimage,
                    child: Container(width: 30, height: 30))
              ],
            ),
            SizedBox(height: 10),
            if (loginType == 2)
              Container(
                  height: 30,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => changeLoginType(1),
                        child: Text('Login'),
                      ),
                      GestureDetector(
                        onTap: () => changeLoginType(3),
                        child: Text('str17'),
                      ),
                    ],
                  ))
            else if (loginType == 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => changeLoginType(2),
                    child: Text('Sign Up'),
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
}
