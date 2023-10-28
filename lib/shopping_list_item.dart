import 'package:flutter/material.dart';

class ShoppingListItem extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;

  ShoppingListItem({required this.itemName, required this.itemPrice, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset(imagePath),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    itemPrice,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(Icons.remove, size: 20.0),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: 50.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            '1', // 这里的数字可以根据实际需求进行更改
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(Icons.add, size: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}