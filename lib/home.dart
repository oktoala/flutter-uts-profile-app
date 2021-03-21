import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: SafeArea(
        child: ListView(
          children: [
            PrettyFace(),
            Biografi(
              icon: Icons.person_pin,
              bio: "Nama saya",
              value: "Oktavian Yoga Syahputra",
            ),
            Biografi(
              icon: Icons.badge,
              bio: "NIM",
              value: "1915016074",
            ),
            Biografi(
              icon: Icons.cake_outlined,
              bio: "Lahir tanggal",
              value: "29 Oktober 2001",
            ),
            Biografi(
              icon: Icons.calendar_today_outlined,
              bio: "Umur",
              value: "20 tahun",
            ),
            Biografi(
              icon: Icons.house_outlined,
              bio: "Tinggal di",
              value: "Sangasanga",
            ),
            Biografi(
              icon: Icons.school_outlined,
              bio: "Kuliah di",
              value: "Universitas Mulawarman",
            ),
            Biografi(
              icon: Icons.book_outlined,
              bio: "Hobi saya",
              value: "Membaca",
            ),
            Biografi(
              icon: Icons.rice_bowl_outlined,
              bio: "Makanan favorit",
              value: "Nasi Goreng",
            ),
            Biografi(
              icon: Icons.star_border,
              bio: "Cita-cita",
              value: "Crazy Rich-Rt19 💰💰",
            ),
            Biografi(
              icon: Icons.format_quote_outlined,
              bio: 'Motto',
              value: "'Me Roaring Myself'",
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

// ignore: must_be_immutable
class PrettyFace extends StatelessWidget {
  int jam = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 90,
              child: Image.asset(
                'assets/img/avatar3.png',
              )),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jam >= 5 && jam <= 18
                    ? "☀️ Selamat Datang ☀️"
                    : "Selamat Malam 🌑",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(kIsWeb ? "Web User" : "Mobile User"),
            ],
          )
        ],
      ),
    );
  }
}
