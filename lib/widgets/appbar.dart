import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonAppbar extends StatefulWidget {
  @override
  _CommonAppbarState createState() => _CommonAppbarState();
}

class _CommonAppbarState extends State<CommonAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Sagar Kitchen',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.amber,
      centerTitle: true,
      actions: <Widget>[
      IconButton(
        onPressed: (){
          launch("tel://9831242861");
        },
        color: Colors.white,
        icon: Icon(Icons.phone),
      )
      ],
    );
  }
}
