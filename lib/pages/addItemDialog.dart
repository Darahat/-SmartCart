import 'package:flutter/material.dart';
import 'package:smartCart/sql_helper.dart';

class AddItemDialog extends StatelessWidget {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Item"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: itemDescriptionController,
              decoration: InputDecoration(labelText: 'Item Description'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add logic to save the item
            String title = itemNameController.text;
            String descrption = itemDescriptionController.text;
            // print(itemDescription);
            // print(itemName);
            SQLHelper.createItem(title, descrption);

            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
