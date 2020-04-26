import 'package:flutter/material.dart';

class Stream extends StatefulWidget {
  Stream({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StreamState createState() => _StreamState();
}

class _StreamState extends State<Stream> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Local Stream',
      home: Scaffold(

      ),
    );
  }
}