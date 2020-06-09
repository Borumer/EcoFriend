import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'ClientModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "EcoFriendDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Client ("
              "id	INTEGER,"
              "first_name	TEXT,"
              "last_name	TEXT,"
              "school	TEXT,"
              "state	TEXT,"
              "nation	TEXT,"
              "points	INTEGER NOT NULL DEFAULT 0,"
              "password	TEXT DEFAULT 'password',"
              "PRIMARY KEY('id')"
          ")");
        }
    );
  }

  newClient(Client newClient) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];
    //insert to the table using the new id
    print ("ID IS: " + id.toString());
    var raw = await db.rawInsert(
        "INSERT Into Client (id,first_name,last_name,school,state,nation,points,password)"
            " VALUES (?,?,?,?,?,?,0,?)",
        [id, newClient.firstName, newClient.lastName, newClient.school, newClient.state, newClient.nation, newClient.password]);
    return raw;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  Future<List<Client>> getClientByGroup(String column) async {
    final db = await database;
    var res = await db.rawQuery("SELECT $column, SUM(points) AS points FROM Client GROUP BY $column ORDER BY points DESC");
    res.forEach((row) => print(row));
    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [Client(firstName: "Hello", lastName: "World", points: 0, school: "Middlerock High School", state: "Never", nation: "Neverland")];
    return list;
  }

  getClientLogin(String name, String password) async {
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM Client WHERE password = ? AND (last_name = ? OR first_name = ? OR first_name || ' ' || last_name = ?)", [password, name, name, name]);
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.delete("Client", where: "id > ?", whereArgs: [1]);
  }
}