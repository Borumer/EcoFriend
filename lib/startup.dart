import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Startup extends StatefulWidget {
  Startup({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Local Startup',
      home: Scaffold(
        appBar: AppBar(
            title: Center(child: Text("EcoFriend"))
        ),
        body: ListView(
          children: [
            RaisedButton(
              child: Text(
                "Login"
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Login');
              },
            ),
            RaisedButton(
              child: Text(
                "Register"
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Register');
              },
            )
          ]
        ),
      ),
    );
  }
}