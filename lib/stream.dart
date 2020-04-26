import 'dart:async';
import 'dart:math';
import 'nav.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stream extends StatefulWidget {
  Stream({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StreamState createState() => _StreamState();
}

class _StreamState extends State<Stream> {

  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http.get("https://reqres.in/api/users?page=2");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Stream',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(userData[index]["avatar"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );


  }
}

var total = 105;
var pageSize = 20;
var completers = new List<Completer<Item>>();

class Item {
  int id;
  String name;

  Item({this.id, this.name});
}

Future<List<Item>> _loadItems(int offset, int limit) {
  var random = new Random();
  return Future.delayed(new Duration(seconds: 2 + random.nextInt(3)), () {
    return List.generate(limit, (index) {
      var id = offset + index;
      return new Item(id: id, name: "Item $id");
    });
  });
}

Widget _loadItem(int itemIndex) {
  if (itemIndex >= completers.length) {
    int toLoad = min(total - itemIndex, pageSize);
    completers.addAll(List.generate(toLoad, (index) {
      return new Completer();
    }));
    _loadItems(itemIndex, toLoad).then((items) {
      items.asMap().forEach((index, item) {
        completers[itemIndex + index].complete(item);
      });
    }).catchError((error) {
      completers.sublist(itemIndex, itemIndex + toLoad).forEach((completer) {
        completer.completeError(error);
      });
    });
  }

  var future = completers[itemIndex].future;
  return new FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Container(
              padding: const EdgeInsets.all(8.0),
              child: new Placeholder(fallbackHeight: 100.0),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return _generateItem(snapshot.data);
            } else if (snapshot.hasError) {
              return new Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.red),
              );
            }
            return new Text('');
          default:
            return new Text('');
        }
      });
}

Widget _generateItem(Item item) {
  return new Container(
    padding: const EdgeInsets.all(8.0),
    child: new Row(
      children: <Widget>[
        new Image.network(
          'http://via.placeholder.com/200x100?text=Item${item.id}',
          width: 200.0,
          height: 250.0,
        ),
        new Expanded(child: new Text(item.name))
      ],
    ),
  );
}

class InfiniteListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Stream')),
      body: new ListView.builder(
          itemCount: total,
          itemBuilder: (BuildContext context, int index) => _loadItem(index)),
    );
  }
}

