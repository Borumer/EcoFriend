import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/gestures.dart';

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
              style: TextStyle (fontSize: 18.0)
          ),
        ),
            backgroundColor: Colors.blue[300],
            body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          width: 190.0,
                          height: 190.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      "alt1.png")
                              )
                          )),
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
                      color: Colors.red[400],
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 200,
                    child: Divider(
                      color: Colors.teal[100],
                    ),
                  ),
                   Card(
                        color: Colors.white,
                        margin:
                              EdgeInsets.symmetric(/*vertical: 10.0, horizontal 25.0*/),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            color:Colors.teal[900],
                        ),
                        title: Text(
                         'Profile:',
                        style:
                            TextStyle(fontFamily: 'BaloooBhai')
                        ),
                        )),
                  Card(
                      color: Colors.white,
                      margin:
                        EdgeInsets.symmetric(/*horizontal 25.0, vertical: 10.0*/),
                    child: ListTile(
                      leading: Icon(
                        Icons.cake,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        'Likes Count',
                        style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
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




