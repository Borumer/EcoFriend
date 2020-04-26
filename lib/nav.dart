import 'package:flutter/material.dart';
Widget displayNav(context) {
  Color color = Theme.of(context).primaryColor;

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: RaisedButton(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/' + label);
                }
            )
        ),
      ],
    );
  }

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Profile'),
        _buildButtonColumn(color, Icons.near_me, 'Stream'),
        _buildButtonColumn(color, Icons.share, 'Leaderboard'),
      ],
    ),
  );
}
