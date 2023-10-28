import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _verificationCodeController = TextEditingController();
  bool showLogin = false;
  int loginType = 2;
  String codeTips = 'Get Code';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  void getCode() {
    // implement your code to get code
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
      title: Text(''),
      content: Column(
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
              ],
            ),
          SizedBox(height: 70),
          TextField(
            controller: _emailController,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 200, // 设置一个明确的宽度约束
                    child: TextField(
                      controller: _verificationCodeController,
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
                TextButton(
                  onPressed: getCode,
                  child: Text(codeTips),
                ),
              ],
            ),
          SizedBox(height: 30),
          TextField(
            controller: _verificationCodeController,
            decoration: InputDecoration(
              labelText: '验证码',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('登录'),
          onPressed: () {
            // 在这里处理登录逻辑
            String email = _emailController.text;
            String password = _passwordController.text;
            String verificationCode = _verificationCodeController.text;

            // 执行登录操作，可以调用登录接口或进行其他验证操作

            Navigator.of(context).pop(); // 关闭对话框
          },
        ),
      ],
    );
  }
}
