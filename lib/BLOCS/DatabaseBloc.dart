import 'dart:async';

import '../ClientModel.dart';
import '../Database.dart';

class ClientsBloc {
  final _clientController = StreamController<List<Client>>.broadcast();

  get clients => _clientController.stream;

  dispose() {
    _clientController.close();
  }

  getClients() async {
    _clientController.sink.add(await DBProvider.db.getAllClients());
  }

  ClientsBloc() {
    getClients();
  }

  getRow(int id) {
    return DBProvider.db.getClient(id);
  }

  getRowByLogin(String name, String password) {
    return DBProvider.db.getClientLogin(name, password);
  }

  getLeaderboardData(String column) {
    return DBProvider.db.getClientByGroup(column);
  }

  getLeaderboardDataDefault() {
    return getLeaderboardData("school");
  }

  deleteAll() {
    DBProvider.db.deleteAll();
  }

  update(Client newClient) {
    DBProvider.db.updateClient(newClient);
  }

  delete(int id) {
    DBProvider.db.deleteClient(id);
    getClients();
  }

  add(Client client) {
    DBProvider.db.newClient(client);
    getClients();
  }
}