import 'package:flutter/material.dart';
import 'package:utsmobile/home.dart';
import 'package:utsmobile/school.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(color: Colors.black12),
            primaryIconTheme: IconThemeData(color: Colors.white),
            accentIconTheme: IconThemeData(color: Colors.white38),
            accentColor: Colors.black26),
        home: TabBarKu());
  }
}

class TabBarKu extends StatefulWidget {
  @override
  _TabBarKuState createState() => _TabBarKuState();
}

class _TabBarKuState extends State<TabBarKu> {
  TabController tabController;
  List<Widget> tabs;

  IconData home = Icons.home;
  IconData school = Icons.school_outlined;
  IconData person = Icons.person_outline_outlined;

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
              person = tabController.index != 2
                  ? Icons.person_outline_outlined
                  : Icons.person;
            });
          });
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 50,
                bottom: TabBar(
                    unselectedLabelColor:
                        Theme.of(context).accentIconTheme.color,
                    indicatorColor: Colors.transparent,
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
              body: TabBarView(children: [
                Home(),
                School(),
                Text("Jajja"),
              ]));
        }));
  }
}
