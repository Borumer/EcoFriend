import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';


class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Local Profile',
      home: Scaffold(

      ),
    );
  }
}



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//This widget is the rest of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Profile Page UI",
              style: TextStyle(fontSize: 18.0)
          ),
        ),
        backgroundColor: Colors.green[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Center(
                  child: CircleAvatar(
                    radius: 100,
                       child: Image.asset('assets/images/hahaha.png'),
                      ),
                  ),
                //Working circular avatar code but uses URL
                /*Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                    ),
                  ),
                ),*/
                Text(
                  'Test User',
                  style: TextStyle(
                    fontFamily: 'Roboto-BlacklistingTextInputFormatter',
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Go recycle',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto-BlacklistingTextInputFormatter',
                    color: Colors.lightGreen[100],
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.greenAccent[100],
                  ),
                ),
                Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(/*vertical: 10.0, horizontal 25.0*/),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.greenAccent[900],
                      ),
                      title: Text(
                          'Profile:',
                          style:
                          TextStyle(fontFamily: 'Roboto-BlacklistingTextInputFormatter')
                      ),
                    )),
                Card(
                  color: Colors.white,
                  margin:
                  EdgeInsets.symmetric(/*horizontal 25.0, vertical: 10.0*/),
                  child: ListTile(
                    leading: Icon(
                      Icons.cake,
                      color: Colors.greenAccent[900],
                    ),
                    title: Text(
                      'Likes Count',
                      style: TextStyle(fontSize: 20.0, fontFamily: 'Roboto-BlacklistingTextInputFormatter'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
