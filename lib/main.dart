import 'package:flutter/material.dart';
import 'package:sagar_kitchen/screens/eventmaker.dart';
import 'package:sagar_kitchen/screens/homepage.dart';
import 'package:sagar_kitchen/screens/items.dart';
import 'package:sagar_kitchen/screens/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        EventsMaker.id: (context) => EventsMaker(),
        Items.id: (context) => Items(),
        Menu.id: (context) => Menu(),
      },
    );
  }
}
