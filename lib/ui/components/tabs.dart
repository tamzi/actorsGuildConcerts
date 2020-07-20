import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 25),
        MyTab(text: 'Nearby', isSelected: true),
        MyTab(text: 'Recent', isSelected: false),
        MyTab(text: 'Notice', isSelected: false),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MyTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 20 : 15,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
