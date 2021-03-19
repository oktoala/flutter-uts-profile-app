import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nama = "Oktavian Yoga Syahputra";
  String nim = "1915016074";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            // margin: EdgeInsets.only(top: 30, right: 30, left: 30),
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 60,
                    child: Image.asset(
                      'assets/img/avatar3.png',
                    )),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text(nim),
                  ],
                )
              ],
            ),
          ),
          Biografi(
            icon: Icons.person_pin,
            bio: "Hi, nama saya",
            value: "Oktavian Yoga Syahputra",
          ),
          Biografi(
            icon: Icons.calendar_today_outlined,
            bio: "Umur",
            value: "20 tahun",
          ),
          Biografi(
            icon: Icons.book_outlined,
            bio: "Hobi saya",
            value: "Membaca",
          ),
          Biografi(
            icon: Icons.house_outlined,
            bio: "Tinggal di",
            value: "Sangasanga",
          ),
        ],
      ),
    );
  }
}

class Biografi extends StatelessWidget {
  IconData icon;
  String bio;
  String value;

  Biografi({this.icon, this.bio, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black12,
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Icon(icon,
                  size: 15, color: Theme.of(context).accentIconTheme.color)),
          Container(
              padding: EdgeInsets.only(right: 5),
              child: Text(
                bio,
                style:
                    TextStyle(color: Theme.of(context).accentIconTheme.color),
              )),
          Text(value)
        ],
      ),
    );
  }
}
