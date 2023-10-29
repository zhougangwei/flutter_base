import 'dart:convert';

import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../network/api.dart';
import '../network/user.dart';

class GoodCastList extends StatefulWidget {
  @override
  _GoodCastListState createState() => _GoodCastListState();
}

class _GoodCastListState extends State<GoodCastList> {
  List<dynamic> getGoodsCatlist = [];

  @override
  void initState() {
    super.initState();
    getGoodsCat();
  }

  void getGoodsCat() {
    HttpClient().getGoodsCat({}).then((res) {
      if (res.status) {
        setState(() {
          getGoodsCatlist = res.data;
        });
      }
    }).catchError((err) {
      // Handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: getGoodsCatlist.length,
        itemBuilder: (context, index) {
          var item = getGoodsCatlist[index];
          if (item['child'].length > 0) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Divider(color: Colors.blue, thickness: 1),
                  SizedBox(height: 40),
                  Text(
                    item['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Divider(color: Colors.grey, thickness: 1),
                  Row(
                    children: item['child'].map<Widget>((ite) {
                      return Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            ite['name'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: item['goods'].map<Widget>((it) {
                          return Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () => goodsinfo(it['id']),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Image.network(
                                      it['image_url'],
                                      width: double.infinity,
                                      height: 390,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      it['name'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '$${it['price']}-$${it['mktprice']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  goodsinfo(it) {}
}