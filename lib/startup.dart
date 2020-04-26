import 'package:flutter/material.dart';

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
            Container(
              child:RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
              ),
              margin: EdgeInsets.only(top: 230.0),
              padding: EdgeInsets.all(5.0),
              height: 100
            ),

            Container(
              child: RaisedButton(
                child: Text(
                  "Register"
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Register');
                },
              ),
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(5.0),
              height: 100
            )
          ]
        ),
      ),
    );
  }
}