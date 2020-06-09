import 'package:EcoFriend/BLOCS/DatabaseBloc.dart';
import 'package:flutter/material.dart';
import 'nav.dart';
import 'ClientModel.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LeaderboardState createState() => _LeaderboardState();
}


class _LeaderboardState extends State<Leaderboard> {
  String dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    dropdownValue = 'Individual';
    super.initState();
  }

  final TextStyle lbSlot = TextStyle(
    fontSize: 20.0,
    height: 2,
  );
  ClientsBloc bloc = ClientsBloc();

  Widget _buildGroupedSection() {
    return Container(
      child: StreamBuilder<List<Client>>(
        stream: Stream.fromFuture(bloc.getLeaderboardDataDefault()),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];
                return Container(
                  child: Center(
                      child: Container(
                          width: 400,
                          color: Colors.orange[600],
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: ListTile(
                              title: Text(item.toMap()['school'], style: lbSlot),
                              leading: Text((index + 1).toString(), style: lbSlot,
                              ),
                              trailing: Text(item.toMap()['points'].toString() + " pts")
                          )
                      )
                  ),
                );
              }
            );
          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }
        },
      )
    );
  }

  ClientsBloc bloc2 = ClientsBloc();

  Widget _buildPeopleSection() {
    print(bloc2.clients.toString());
    return Container(
      child: StreamBuilder<List<Client>>(
        stream: bloc2.clients,
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];
                String toDisplay = item.toMap()[dropdownValue.toLowerCase()];
                if (item == null) {
                  item = Client(firstName: "Not available", school: "Not available");
                } else {
                  if (toDisplay == null) {
                    toDisplay = item.toMap()['first_name'];
                    toDisplay += " " + item.toMap()['last_name'];
                  }
                }

                return Container(
                  child: Center(
                      child: Container(
                        width: 400,
                        color: Colors.orange[600],
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          title: Text(toDisplay, style: lbSlot),
                          leading: Text((index + 1).toString(), style: lbSlot,
                          ),
                          trailing: Text(item.toMap()['points'].toString() + " pts")
                        )
                    )
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(color: Colors.red, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String data) {
          setState(() {
            dropdownValue = data;
          });
        },
        items: ['Individual', 'School', 'State', 'Nation'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
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
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.purple,
            child: ListView(
              children: [_buildFilterSection(),  _buildPeopleSection(), _buildGroupedSection()],
            )
          )
        ),
        bottomNavigationBar: displayNav(context),
      ),
    );
  }
}