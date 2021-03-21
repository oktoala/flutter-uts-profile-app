import 'package:flutter/material.dart';
import 'package:utsmobile/contact.dart';
import 'package:utsmobile/home.dart';
import 'package:utsmobile/school.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
            buttonTheme: ButtonThemeData(padding: EdgeInsets.all(0)),
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(color: Colors.black12),
            primaryIconTheme: IconThemeData(color: Colors.white),
            accentIconTheme: IconThemeData(color: Colors.white38),
            accentColor: Colors.black26,
            textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800))),
        home: TabBarKu());
  }
}

class TabBarKu extends StatefulWidget {
  @override
  _TabBarKuState createState() => _TabBarKuState();
}

class _TabBarKuState extends State<TabBarKu> {
  IconData home = Icons.home;
  IconData school = Icons.school_outlined;
  IconData person = Icons.phone_outlined;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Builder(builder: (BuildContext context) {
          TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            /* On this state, the icon will change to outlined if aint selected */
            setState(() {
              // print(tabController.index);
              home =
                  tabController.index != 0 ? Icons.home_outlined : Icons.home;
              school = tabController.index != 1
                  ? Icons.school_outlined
                  : Icons.school;
              person =
                  tabController.index != 2 ? Icons.phone_outlined : Icons.phone;
            });
          });
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 50,
                bottom: TabBar(
                    unselectedLabelColor:
                        Theme.of(context).accentIconTheme.color,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        icon: Icon(home),
                      ),
                      Tab(
                        icon: Icon(school),
                      ),
                      Tab(
                        icon: Icon(person),
                      ),
                    ]),
              ),
              body: TabBarView(children: [Home(), School(), Contact()]));
        }));
  }
}
