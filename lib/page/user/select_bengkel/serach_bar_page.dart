import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Widget icon;
  final TextEditingController controller;

  const SearchBar({
    this.controller,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: "Search Place",
      icon: icon,
      border: InputBorder.none,
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29.5),
          border: Border.all(color: Colors.black, width: 2)),
      child: TextField(
        controller: controller,
        decoration: inputDecoration,
      ),
    );
  }
}
