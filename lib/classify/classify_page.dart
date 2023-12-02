import 'dart:convert';

import 'package:atest/good/good_foot.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../good/good_page2.dart';
import '../network/user.dart';
import '../shop/bean/feature_entity.dart';
import '../widget/rounded_searchbar.dart';
import '../widget/custom_scaffoldr.dart';

class ClassifyPage extends StatefulWidget {
  final int id;
  final String name;
  final String where;

  ClassifyPage({required this.id, required this.name,required this.where});

  @override
  _ClassifyPageState createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  List<FeatureEntity> featurednlist = [];
  var datapost = {"page": "1", "limit": "10", "order": "price asc"};
  String classifyName = '';

  @override
  void initState() {
    super.initState();

    if(widget.id!=-1){
      datapost['where'] = '{"type_id":${widget.id}}';
    }else{
      datapost['where']= widget.where;
    }
    relatedList();
    classifyName = widget.name;
  }

  void relatedList() {
    var data = datapost;
    print(jsonEncode(data) + "----data");
    ApiClient().relatedlist(data).then((res) {
      if (res['status']) {
        setState(() {
          featurednlist = jsonConvert
                  .convertListNotNull<FeatureEntity>(res['data']['list']) ??
              [];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  goodsinfo(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoodPage2(goods_id: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScafflold(
        body: CustomScrollView(
      physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
      slivers: [

        SliverToBoxAdapter(
            child: Center(
          child: Padding(
            padding:  EdgeInsets.all(40.w),
            child: Text(
              textAlign: TextAlign.center,
              classifyName,
              style: TextStyle(
                  fontSize: 62.sp, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        )),
        buildFeatured(),
        SliverToBoxAdapter(child: GoodFoot()),
      ],
    ));
  }

  void meninfo(int id, String name) {}

  buildFeatured() {
    return SliverToBoxAdapter(
        child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Container(
                  width: 132,
                  child: Column(
                    children: [
                      Text(
                        "Featured",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.grey, thickness: 1)
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: featurednlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 一行显示
                childAspectRatio: 335 / 475, // 调整子项的宽高比例
                crossAxisSpacing: 10, // 子项之间的横向间距
                mainAxisSpacing: 10, // 两个子项
              ),
              itemBuilder: (BuildContext context, int index) {
                var item = featurednlist[index];
                return GestureDetector(
                  onTap: () => goodsinfo(item.id),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CachedNetworkImage(imageUrl: item.image_url),
                          Text(
                            item.cat_name,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.name,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$${item.price}-\$${item.mktprice}',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }

  void collection(int id, int index) {}
}
