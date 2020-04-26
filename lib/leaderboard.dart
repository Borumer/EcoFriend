import 'package:flutter/material.dart';
import 'nav.dart';


class Leaderboard extends StatefulWidget {
  Leaderboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LeaderboardState createState() => _LeaderboardState();
}


class _LeaderboardState extends State<Leaderboard> {
  Widget _buildLeaderboardSection() {
    var people = ["Bob", "Fred", "Victoria", "Lan", "Varun", "Jose", "User654335", "User198432", "Neil", ""];
    return Container(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              color: Colors.amber[600],
              child: Text("${index + 1}             ${people[index]}"),
            );
          },
          separatorBuilder: (BuildContext context,
              int index) => const Divider(),
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
        body: _buildLeaderboardSection(),
        bottomNavigationBar: displayNav(context),
      ),
    );
  }
}