import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'nav.dart';

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
        bottomNavigationBar: displayNav(context),
        appBar: AppBar(
          title: Text("User Profile", style: TextStyle(fontSize: 18.0),),
          backgroundColor: Colors.green[900],
        ),

        //App background
        backgroundColor: Colors.green[300],
        body: SafeArea(
          child: Center(
            child: ListView(
              children: <Widget>[

                Text(
                  'Jane Doe',
                  style: TextStyle(fontFamily: 'Roboto-BlacklistingTextInputFormatter', fontSize: 10,),
                ),

                //profile picture
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/790357/pexels-photo-790357.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  ),
                ),

                //UserName
                Text(
                  'Jane Doe',
                  style: TextStyle(fontFamily: 'Roboto-BlacklistingTextInputFormatter', fontSize: 25,),
                ),

                //User Title
                Text(
                  'Urban Enviromental Activist',
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto-BlacklistingTextInputFormatter', color: Colors.lightGreen[100], letterSpacing: 2.5,),
                ),
                SizedBox(
                  height: 15.0,
                  width: 150,
                  child: Divider(color: Colors.greenAccent[100],),
                ),

                //profile card
                Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(),
                    child: ListTile(
                      title: Text('Profile:', style: TextStyle(fontSize: 20.0, fontFamily: 'Roboto-BlacklistingTextInputFormatter')),
                    )),

                //Team Card
                Card(
                  color: Colors.white,
                  margin:
                  EdgeInsets.symmetric(),
                  child: ListTile(
                    leading: Icon(Icons.brightness_5, color: Colors.deepOrange[900],),
                    title: Text('Team: Soloar', style: TextStyle(fontSize: 20.0, fontFamily: 'Roboto-BlacklistingTextInputFormatter'),),
                  ),),

                //Point count since account creation
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(),
                  child: ListTile(
                    leading: Icon(Icons.done_outline, color: Colors.greenAccent[900],),
                    title: Text('All time point total', style: TextStyle(fontSize: 20.0, fontFamily: 'Roboto-BlacklistingTextInputFormatter'),),
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



