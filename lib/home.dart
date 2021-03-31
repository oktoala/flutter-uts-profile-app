import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<String> baju = ["black", "white", "grey", "red"];

class _HomeState extends State<Home> {
  String currbaju = baju[0];
  int index = 0;

  void gantiBaju() {
    if (index == 3) {
      index = 0;
    } else {
      index += 1;
    }

    setState(() {
      index = index;
      currbaju = baju[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: SafeArea(
        child: ListView(
          children: [
            PrettyFace(
              // ignore: unnecessary_brace_in_string_interps
              pathBaju: "assets/gif/${currbaju}.gif",
              onPressed: gantiBaju,
            ),
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
              bio: "Hobi",
              value: "Membaca",
            ),
            Biografi(
              icon: Icons.rice_bowl_outlined,
              bio: "Makanan favorit",
              value: "Nasi Goreng",
            ),
            Biografi(
              icon: Icons.favorite_border_outlined,
              bio: "Kriteria Pasangan",
              value: "Punya antibodi covid",
            ),
            Biografi(
              icon: Icons.star_border,
              bio: "Cita-cita",
              value: "Survive Covid",
            ),
            Biografi(
              icon: Icons.format_quote_outlined,
              bio: 'Motto',
              value: "Different > No.1",
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
  String pathBaju;
  void Function() onPressed;
  int jam = DateTime.now().hour;

  PrettyFace({this.pathBaju, this.onPressed});

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
            height: 90,
            width: 90,
            margin: EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              tooltip: "Ganti Baju ",
              foregroundColor:
                  Theme.of(context).floatingActionButtonTheme.foregroundColor,
              onPressed: onPressed,
              child: Container(
                height: 90,
                width: 90,
                // color: Colors.red,
                child: CircleAvatar(
                  foregroundImage: AssetImage(
                    pathBaju,
                  ),
                ),
              ),
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jam >= 5 && jam <= 18
                    ? "☀️ Selamat Datang ☀️"
                    : "🌙 Selamat Malam 🌙",
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
