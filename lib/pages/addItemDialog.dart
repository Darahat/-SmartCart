import 'package:flutter/material.dart';
import 'package:smartCart/sql_helper.dart';

class AddItemDialog extends StatefulWidget {
  final Map<String, dynamic>? data;
  AddItemDialog({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  late TextEditingController itemNameController = TextEditingController();
  late TextEditingController itemDescriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty values or with values of the item being edited
    itemNameController =
        TextEditingController(text: widget.data?['title'] ?? '');
    itemDescriptionController =
        TextEditingController(text: widget.data?['description'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data?['title'] ?? '');
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
            if (widget.data == null) {
              SQLHelper.createItem(title, descrption);
            } else {
              int id = widget.data?['id'] ?? -1;
              if (id != -1) {
                SQLHelper.updateItem(id, title, descrption);
              }
            }

            Navigator.of(context).pop();
          },
          child: Text(widget.data == null ? 'Save' : 'Update'),
        ),
      ],
    );
  }
}
