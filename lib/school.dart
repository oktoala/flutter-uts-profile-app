import 'package:flutter/material.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Text("Hahhah")
          YearItems(),
          YearItems(),
        ],
      ),
    );
  }
}

class YearItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("2019"),
          Row(
            children: [Text("Python"), Text("Java"), Text("C++")],
          )
        ],
      ),
    );
  }
}
