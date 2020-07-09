import 'package:flutter/material.dart';
import 'ClientModel.dart';

class Rankings extends StatelessWidget {
  final AsyncSnapshot<List<Client>> snapshot;
  final TextStyle lbSlot;
  final String dropdownValue;

  Rankings(this.snapshot, this.lbSlot, this.dropdownValue);

  Widget _buildRankingItem(BuildContext context, int index) {
    Client item = snapshot.data[index];
    return Container(
      child: Center(
          child: Container(
              width: 400,
              color: Colors.orange[600],
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 2),
              child: ListTile(
                  title: Text(validateDropdownValue(item.toMap()), style: lbSlot),
                  leading: Text(
                    (index + 1).toString(),
                    style: lbSlot,
                  ),
                  trailing: Text(item.toMap()['points'].toString() + " pts")))),
    );
  }

  String validateDropdownValue(Map<String, dynamic> itemMap) {
    if (dropdownValue.toLowerCase() == 'individual') {
      return itemMap['first_name'] + " " + itemMap['last_name'];
    }
    return itemMap[dropdownValue];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: _buildRankingItem,
        itemCount: 10);
  }
}
