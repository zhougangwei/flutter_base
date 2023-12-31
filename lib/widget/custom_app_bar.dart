import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../language/current_locale.dart';
import '../language/language_sp_utils.dart';
import '../login/page_controller_provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  List<Map<String, String>> langList = [
    {"label": 'German', "value": 'de'},
    {"label": 'Spanish', "value": 'es'},
    {"label": 'Chinese', "value": 'zh'},
    {"label": 'English', "value": 'en'},
    {"label": 'French', "value": 'fr'},
    {"label": 'Japanese', "value": 'ja'},
    {"label": 'Italian', "value": 'it'},
  ];

  CustomAppBar({required this.scaffoldKey});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
  }

  String? chooseLanguage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Row(
            children: [
              getCountry(context),
              SizedBox(width: 13.w),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Provider.of<PageControllerProvider>(context, listen: false)
                        .goToPage(3);
                  },
                  child: Image.asset('assets/images/image/icon-1.png',
                      width: 37.w)),
              SizedBox(width: 28.w),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Provider.of<PageControllerProvider>(context, listen: false)
                        .goToPage(1);
                  },
                  child: Image.asset('assets/images/image/icon-3.png',
                      width: 37.w)),
              SizedBox(width: 34.w),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Provider.of<PageControllerProvider>(context, listen: false)
                        .goToPage(2);
                  },
                  child: Image.asset('assets/images/image/icon-2.png',
                      width: 37.w)),
              SizedBox(width: 28.w),
            ],
          ),
        ],
        leadingWidth: 150,
        leading: Container(
          width: 120,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // 图片点击后执行的代码
                  widget.scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    padding: EdgeInsets.all(30.w),
                    child: Icon(Icons.menu, color: Colors.white)),
              ),
              Image.asset('assets/images/image/icon-logo.png', width: 113.w),
            ],
          ),
        ));
  }

  Widget getCountry(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showPickerBottomSheet(context);
        },
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Image.asset(
              'assets/images/image/${Provider.of<CurrentLocale>(context).getCurrentCountryCodeImgCode()}.png',
              width: 37.w),
        ));
  }

  void _showPickerBottomSheet(BuildContext scontext) {
    var languageType = LanuageSpUtil.getLanguageType();
    int _selectedOptionIndex = 0;
    for (int i = 0; i < widget.langList!.length; i++) {
      Map<String, String> language = widget.langList[i];
      if (language['value'] == languageType) {
        _selectedOptionIndex = i;
      }
    }
    showModalBottomSheet(
      context: scontext,
      builder: (BuildContext dialogcontext) {
        return Container(
          height: 500.h,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(dialogcontext);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'cancellation',
                          style: TextStyle(
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (chooseLanguage != null) {
                          Provider.of<CurrentLocale>(context, listen: false)
                              .setLanaugaeCode(chooseLanguage);
                        }
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'confirm',
                          style: TextStyle(
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey[400],
              ),
              Container(
                height: 385.h,
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                      initialItem: _selectedOptionIndex),
                  onSelectedItemChanged: (int index) {
                    chooseLanguage = widget.langList[index]['value'];
                  },
                  children: widget.langList.map((Map<String, String> map) {
                    return Center(
                      child: Text(
                        map['label'] ?? "",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
