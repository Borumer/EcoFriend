import 'package:flutter/material.dart';
import 'nav.dart';


class Leaderboard extends StatefulWidget {
  Leaderboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LeaderboardState createState() => _LeaderboardState();
}


class _LeaderboardState extends State<Leaderboard> {
  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: DropdownButton<String>(
        hint: Text("Choose your team"),
        items: <String>['Individual', 'School', 'State', 'Global'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {

        },
      )
    );
  }

  Widget _buildLeaderboardSection() {
    var people = ["Bob", "Fred", "Victoria", "Lan", "Varun", "Jose", "User654335", "User198432", "Neil", "Mary"];
    var lb = List<Widget>();
    for (var i = 0; i < people.length; i++) {
      lb.add(
         Container(
             width: 400,
             color: Colors.orange[600],
             padding: EdgeInsets.all(10.0),
             margin: EdgeInsets.symmetric(vertical: 2),
             child: Text(
                 "${i + 1}      ${people[i]}",
                 style: TextStyle(
                  fontSize: 20.0,
                  height: 2,
                 )
             )
         )
      );
    }
    return Container(
        child: Column(
          children: lb
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Local Leaderboard',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Your Leaderboard')),
        ),
        body: ListView(
            children: [_buildFilterSection(), _buildLeaderboardSection()],
        ),
        bottomNavigationBar: displayNav(context),
      ),
    );
  }
}