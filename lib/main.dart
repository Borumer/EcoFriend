import 'package:enviroshare/login.dart';
import 'package:flutter/material.dart';
import 'leaderboard.dart';
import 'profile.dart';
import 'stream.dart';
import 'nav.dart';
import 'register.dart';
import 'startup.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    title: 'EcoFriend',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/Startup',
    routes: {
      // When navigating to the "/" route, build the MyHomePage widget.
      '/': (context) => MyHomePage(),
      // When navigating to the "/Leaderboard" route, build the Leaderboard widget.
      '/Leaderboard': (context) => Leaderboard(),
      // When navigating to the "/Profile" route, build the Profile widget.
      '/Profile': (context) => Profile(),
      // When navigating to the "/Stream" route, build the Stream widget.
      '/Stream': (context) => Stream(),
      // When logging in, build the Login widget.
      '/Login': (context) => Login(),
      // When registering, build the Register widget.
      '/Register': (context) => Register(),
      // When downloading the app and opening for the first time
      '/Startup': (context) => Startup()
    },
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoFriend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'EcoFriend - LB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Created in just 3 days by Lan Bui, Victoria Nguyen, and Varun Singh, EcoFriend is a social network designed to promote awareness of the environment among teens. The app was made using Flutter and Dart, and is available on all operating systems and web browsers. One can connect multiple social media accounts to EcoFriend in order to populate his or her stream with eco-related posts!',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'EcoFriend',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('EcoFriend')),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
          ],
        ),
        bottomNavigationBar: displayNav(context),
      ),
    );
  }


}
