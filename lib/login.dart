import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Local Login',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login"))
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Email Address"),
                Text("Password")
              ],
            ),
            Row()
          ],
        )
      ),
    );
  }
}