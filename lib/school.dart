import 'package:flutter/material.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "Apa aja yang sudah dipelajari?",
            style: Theme.of(context).textTheme.headline1,
          ),
          Learning(
            semester: "Semester 1",
            langauage: [
              LanguageButton(
                path: 'assets/img/python.png',
              ),
              LanguageButton(path: 'assets/img/arduino.png',)
            ],
          )
        ],
      ),
    );
  }
}

class Learning extends StatelessWidget {
  String semester;
  List<Widget> langauage;

  Learning({this.semester, this.langauage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(semester, style: TextStyle(fontWeight: FontWeight.w700),),
          Container(
            child: Row(
              children: langauage,
            ),
          )
        ],
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  String path;
  void onPressed;

  LanguageButton({this.path});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(left: 10),height: 50, child: Image.asset(path));
  }
}
