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

  final bloc = ClientsBloc();
  Widget _buildPeopleSection() {
    List<Client> testClients = [
      Client(firstName: "Raouf", lastName: "Rahiche"),
      Client(firstName: "Zaki", lastName: "oun"),
      Client(firstName: "oussama", lastName: "ali"),
    ];

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
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    bloc.delete(item.id);
                  },
                  child: ListTile(
                    title: Text(item.lastName),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {

                      },
                      value: false,
                    ),
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

  Widget _buildLeaderboardSection() {
    List<dynamic> pplData = [{
      "Individual": "Varun",
      "School": "Lower Moreland High School",
      "State": "Pennsylvania",
      "Nation": "United States"
    },{
      "Individual": "Fred",
      "School": "Upper Moreland High School",
      "State": "Colorado",
      "Nation": "Mexico"
    },{
      "Individual": "Victoria",
      "School": "John Hopkins University",
      "State": "Bayern",
      "Nation": "Canada"
    },{
      "Individual": "Lan",
      "School": "University of Texas at Dallas",
      "State": "Goa",
      "Nation": "India"
    },{
      "Individual": "Bob",
      "School": "Princeton University",
      "State": "Texas",
      "Nation": "Germany"
    },{
      "Individual": "Jose",
      "School": "Julia R. Masterman School",
      "State": "Quintana Roo",
      "Nation": "China"
    },{
      "Individual": "User654335",
      "School": "James Madison University",
      "State": "Great Britain",
      "Nation": "United Kingdom"
    },{
      "Individual": "User624965",
      "School": "Harvard University",
      "State": "Paris",
      "Nation": "France"
    },{
      "Individual": "Neil",
      "School": "Concord High School",
      "State": "New Jersey",
      "Nation": "Panama"
    }, {
      "Individual": "Mary",
      "School": "Newark High School",
      "State": "New York",
      "Nation": "South Africa"
    }];
    var lb = List<Widget>();
    for (var i = 0; i < pplData.length; i++) {
      String val = pplData[i][dropdownValue];
      lb.add(
         Container(
             width: 400,
             color: Colors.orange[600],
             padding: EdgeInsets.all(10.0),
             margin: EdgeInsets.symmetric(vertical: 2),
             child: Text(
                 "${i + 1}      $val",
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
            children: [_buildFilterSection(),  _buildLeaderboardSection(), _buildPeopleSection()],
        ),
        bottomNavigationBar: displayNav(context),
      ),
    );
  }
}