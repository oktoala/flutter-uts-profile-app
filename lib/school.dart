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
    'no': 'Semester 1',
    'python': 'assets/img/python.png',
    'arduino': 'assets/img/arduino.png',
    'pythonBlog': 'assets/markdown/python.md',
    'arduinoBlog': 'assets/markdown/arduino.md',
  };

  var semester2 = {
    'no': 'Semester 2',
    'cpp': 'assets/img/cpp.png',
    'java': 'assets/img/java.png',
    'tux': 'assets/img/tux.png',
    'cppBlog': 'assets/markdown/cpp.md',
    'javaBlog': 'assets/markdown/java.md',
    'tuxBlog': 'assets/markdown/tux.md',
  };

  var semester3 = {
    'no': 'Semester 3',
    'data': 'assets/img/data.png',
    'dataBlog': 'assets/markdown/data.md',
    'sql': 'assets/img/sql.png',
    'sqlBlog': 'assets/markdown/sql.md',
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
          LearningBar(
            semester: semester1['no'],
            langauage: [
              LanguageButton(
                path: semester1['python'],
                onPressed: () {
                  Navigator.of(context).push(_createRoute(semester1['no'],
                      semester1['python'], semester1['pythonBlog']));
                },
              ),
              LanguageButton(
                path: semester1['arduino'],
                onPressed: () {
                  Navigator.of(context).push(_createRoute(semester1['no'],
                      semester1['arduino'], semester1['arduinoBlog']));
                },
              )
            ],
          ),
          LearningBar(
            semester: semester2['no'],
            langauage: [
              LanguageButton(
                path: semester2['cpp'],
                onPressed: () => Navigator.of(context).push(_createRoute(
                    semester2['no'], semester2['cpp'], semester2['cppBlog'])),
              ),
              LanguageButton(
                path: semester2['java'],
                onPressed: () => Navigator.of(context).push(_createRoute(
                    semester2['no'], semester2['java'], semester2['javaBlog'])),
              ),
              LanguageButton(
                path: semester2['tux'],
                onPressed: () => Navigator.of(context).push(_createRoute(
                    semester2['no'], semester2['tux'], semester2['tuxBlog'])),
              ),
            ],
          ),
          LearningBar(
            semester: semester3['no'],
            langauage: [
              LanguageButton(
                path: semester3['data'],
                onPressed: () => Navigator.of(context).push(_createRoute(
                    semester3['no'], semester3['data'], semester3['dataBlog'])),
              ),
              LanguageButton(
                path: semester3['sql'],
                onPressed: () => Navigator.of(context).push(_createRoute(
                    semester3['no'], semester3['sql'], semester3['sqlBlog'])),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LearningBar extends StatelessWidget {
  String semester;
  List<Widget> langauage;

  LearningBar({this.semester, this.langauage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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

// ignore: must_be_immutable
class LanguageButton extends StatelessWidget {
  String path;
  void Function() onPressed;

  LanguageButton({this.path, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.only(left: 10),
        width: 50,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // alignment: Alignment.,
                padding: EdgeInsets.zero,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 40,
                child: Image.asset(path)),
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

// ignore: must_be_immutable
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
          actions: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Image.asset(logo))
          ],
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
