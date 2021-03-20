import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  /* Kumpulan Maps pelajaran */
  var semester1 = {
    'semester': 'Semester1',
    'python': 'assets/img/python.png',
    'arduino': 'assets/img/arduino.png',
    'pythonBlog': 'assets/markdown/python.md',
    'arduinoBlog': 'assets/markdown/arduino.md',
  };

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
            semester: semester1['semester'],
            langauage: [
              LanguageButton(
                path: semester1['python'],
                onPressed: () {
                  Navigator.of(context).push(_createRoute(semester1['semester'],
                      semester1['python'], semester1['pythonBlog']));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SchoolItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Learning(
      
      
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
          Text(
            semester,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
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
  void Function() onPressed;

  LanguageButton({this.path, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10),
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            child: Image.asset(path),
            onPressed: onPressed));
  }
}

Route _createRoute(String semester, String logo, String blog) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Blog(
      semester: semester,
      logo: logo,
      blog: blog,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Blog extends StatelessWidget {
  String semester;
  String logo;
  String blog;

  Blog({this.semester, this.logo, this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(semester),
          actions: [Image.asset(logo)],
        ),
        body: Container(
            child: FutureBuilder(
          future: rootBundle.loadString(blog),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                styleSheet: MarkdownStyleSheet(
                  blockSpacing: 20,

                ),
                data: snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )));
  }
}
