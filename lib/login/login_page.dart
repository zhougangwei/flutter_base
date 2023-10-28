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
  int loginType = 1;
  String codeTips = 'Get Code';
  String codeImage = 'code_image_url';

  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPwdController = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  String email = '';
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
    if (verificationCodeKey?.currentState?.canGetCode ==true) {
      userSms({email: email, type: type}).then((res) {
        CommonUtils.toast(res['msg']);
        verificationCodeKey.currentState?.start();
      }).catchError((err) {
        // Handle error
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
      content: Container(
        width: 280.0,
        height: 400.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      showLogin = false;
                    });
                  },
                ),
              ],
            ),
            if (loginType == 2)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text('str16'),
                ],
              )
            else if (loginType == 3)
              Column(
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
              )
            else
              Column(
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
              ),
            SizedBox(height: 70),
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
            if (loginType == 2 || loginType == 3) SizedBox(height: 30),
            if (loginType == 2 || loginType == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 200,
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

                    child: UVerificationCode(
                        key: verificationCodeKey
                    ),
                    onTap:() {
                      getCode(verificationCodeKey);
                    },
                  ),
                ],
              ),
            SizedBox(height: 30),
            TextField(
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
            ),
            if (loginType == 2 || loginType == 3) SizedBox(height: 30),
            if (loginType == 2 || loginType == 3)
              TextField(
                controller: againPwdController,
                onChanged: (value) {
                  setState(() {
                    againPwd = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password Again',
                ),
              ),
            SizedBox(height: 30),
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
                ),
              ],
            ),
            SizedBox(height: 50),
            if (loginType == 2)
              Row(
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
              )
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
                    child: Text('str17'),
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
            SizedBox(height: 70),
            GestureDetector(
              onTap: submit,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(20),
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
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
