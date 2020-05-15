import 'package:enviroshare/BLOCS/DatabaseBloc.dart';
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

  ClientsBloc bloc = ClientsBloc();

  Widget _buildPeopleSection() {
    Future<List<Client>> test = bloc.getLeaderboardDataDefault();
    return Container(
      child: StreamBuilder<List<Client>>(
        stream: bloc.clients,
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

                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    bloc.delete(item.id);
                  },
                  child: Center(
                      child: Container(
                        width: 400,
                        color: Colors.orange[600],
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          title: Text(toDisplay, style: TextStyle(
                            fontSize: 20.0,
                            height: 2,
                          )),
                          leading: Text((index + 1).toString(), style: TextStyle(
                            fontSize: 20.0,
                            height: 2,
                          )
                          ),
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
        body: ListView(
            children: [_buildFilterSection(),  _buildPeopleSection()],
        ),
        bottomNavigationBar: displayNav(context),
      ),
    );
  }
}