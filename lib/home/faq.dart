import 'package:atest/good/good_foot.dart';
import 'package:flutter/cupertino.dart';

import '../network/user.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        GoodFoot()
      ],
    );
  }


  @override
  void initState() {
    getfaqlist();
    super.initState();
  }

  void getfaqlist() {
    ApiClient().getfaqlist({}).then((res) {
      if (res['status']) {
        setState(() {
        });
      }
    }).catchError((err) {
      err.toString();
    });

  }

}