import 'package:e_service/page/user/activity/activity_page.dart';
import 'package:e_service/page/user/activity/category.dart';
import 'package:e_service/page/user/activity/detail_service.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Order",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return DetailservicePage();
                }),
              );
            },
          ),
          CategoryItem(
            title: "History",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivtyPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
