import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            // primaryTextTheme: TextTheme(headline1: TextStyle(color: Colors.red)),
            accentColor: Colors.white),
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
            setState(() {
                // print(tabController.index);
                home = tabController.index != 0 ? Icons.home_outlined : Icons.home;
                school = tabController.index != 1 ? Icons.school_outlined : Icons.school;
                person = tabController.index != 2 ?  Icons.person_outline_outlined : Icons.person;
              });
          });
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 50,
                bottom: TabBar(
                    indicatorColor: Colors.transparent,
                    // labelStyle:,
                    // unselectedLabelColor: Colors.white24,
                    tabs: tabs = <Tab>[
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
                Text("Lalla"),
                Text("Lellel"),
                Text("Jajja"),
              ]));
        }));
  }
}
