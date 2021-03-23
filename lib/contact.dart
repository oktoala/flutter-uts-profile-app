import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Kontak Saya!",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ContactBars(
            pathIcon: 'assets/icons/whatsapp.png',
            kontak: "082326785504",
          ),
          ContactBars(
            pathIcon: 'assets/icons/instagram.png',
            kontak: "yogatra29",
          ),
          ContactBars(
            pathIcon: 'assets/icons/twitter.png',
            kontak: "oktoala",
          ),
          ContactBars(
            pathIcon: 'assets/icons/email.png',
            kontak: "okta.yoga.syah@gmail.com",
          ),
          ContactBars(
            pathIcon: 'assets/icons/website.png',
            kontak: "https://dalamkotak.netlify.app",
          ),
          ContactBars(
            pathIcon: 'assets/icons/github.png',
            kontak: "oktoala",
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ContactBars extends StatelessWidget {
  String pathIcon, kontak;

  ContactBars({this.pathIcon, this.kontak});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ImageIcon(
                AssetImage(pathIcon),
                size: 15,
                color: Theme.of(context).accentIconTheme.color,
              )),
          Container(
            child: Text(
              kontak,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
/* Nama saya adalah gaul */