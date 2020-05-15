import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String firstName;
  String lastName;
  String school;
  String nation;
  String state;
  int points;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.school,
    this.nation,
    this.state,
    this.points
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    school: json["school"],
    nation: json["nation"],
    state: json["state"],
    points: json["points"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "school": school,
    "nation": nation,
    "state": state,
    "points": points,
  };
}