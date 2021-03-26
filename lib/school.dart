import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

/* https://s4w.in/A3egA */
class _SchoolState extends State<School> {
  /* Kumpulan Maps pelajaran */
  var semester1 = {
    'no': 'Semester 1',
    /* Python */
    'button1': 'assets/img/python.png',
    'blog1': 'assets/markdown/python.md',
    /* Arduino */
    'button2': 'assets/img/arduino.png',
    'blog2': 'assets/markdown/arduino.md',
  };

  var semester2 = {
    'no': 'Semester 2',
    /* C++ */
    'button1': 'assets/img/cpp.png',
    'blog1': 'assets/markdown/cpp.md',
    /* Java */
    'button2': 'assets/img/java.png',
    'blog2': 'assets/markdown/java.md',
    /* Linux */
    'button3': 'assets/img/tux.png',
    'blog3': 'assets/markdown/tux.md',
  };

  var semester25 = {
    'no': 'Semester 2.5',
    'button1': 'assets/img/arch.png',
    'blog1': 'assets/markdown/arch.md',
  };

  var semester3 = {
    'no': 'Semester 3  ',
    /* Struktur Data */
    'button1': 'assets/img/data.png',
    'blog1': 'assets/markdown/data.md',
    /* MySQL */
    'button2': 'assets/img/sql.png',
    'blog2': 'assets/markdown/sql.md',
    'button3': 'assets/img/jupyter.png',
    'blog3': 'assets/markdown/jupyter.md',
    'button4': 'assets/img/vlan.png',
    'blog4': 'assets/markdown/vlan.md',
  };

  var semester35 = {
    'no': 'Semester 3.5',
    'button1': 'assets/img/hugo.png',
    'blog1': 'assets/markdown/hugo.md',
    'button2': 'assets/img/nodejs.png',
    'blog2': 'assets/markdown/nodejs.md',
  };

  var semester4 = {
    'no': 'Semester 4',
    'button1': 'assets/img/flutter.png',
    'blog1': 'assets/markdown/flutter.md'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Apa aja yang sudah dipelajari?",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          LearningBar(
            lenght: (semester1.length - 1) / 2,
            semesters: semester1,
          ),
          LearningBar(
            lenght: (semester2.length - 1) / 2,
            semesters: semester2,
          ),
          LearningBar(
            lenght: (semester25.length - 1) / 2,
            semesters: semester25,
          ),
          LearningBar(
            lenght: (semester3.length - 1) / 2,
            semesters: semester3,
          ),
          LearningBar(
            lenght: (semester35.length - 1) / 2,
            semesters: semester35,
          ),
          LearningBar(
            lenght: (semester4.length - 1) / 2,
            semesters: semester4,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LearningBar extends StatelessWidget {
  Map<String, String> semesters;
  double lenght;

  LearningBar({this.semesters, this.lenght});

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
          // for (var item in language) ,
          Container(
            width: 85,
            child: Text(
              semesters['no'],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            child: Row(
              children: [
                for (var i = 0; i < lenght; i -= -1)
                  LanguageButton(
                    path: semesters['button${i + 1}'],
                    onPressed: () => Navigator.of(context).push(_createRoute(
                        semesters['no'],
                        semesters['button${i + 1}'],
                        semesters['blog${i + 1}'])),
                  )
              ],
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
      var begin = Offset(-1.0, -1.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
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
