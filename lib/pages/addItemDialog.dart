import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _imageFile; // Variable to store the selected image file

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
    print(widget.data);
    return AlertDialog(
      title: Text(widget.data == null ? 'Add Item' : 'Edit Item'),
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
            SizedBox(height: 16),
            _imageFile != null
                ? Image.file(_imageFile!)
                : Placeholder(
                    strokeWidth: 1.0,
                    fallbackHeight: 50,
                    child: Icon(Icons.image),
                  ),
            ElevatedButton(
                onPressed: () {
                  _selectImage(); // Open image picker
                },
                child: Text('Select Image'))
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
            String description = itemDescriptionController.text;
            String? imagePath = _imageFile?.path;

            // print(itemDescription);
            // print(itemName);
            if (widget.data == null) {
              SQLHelper.createItem(title, description, imagePath!);
            } else {
              int id = widget.data?['id'] ?? -1;
              if (id != -1) {
                SQLHelper.updateItem(id, title, description);
              }
            }

            Navigator.of(context).pop();
          },
          child: Text(widget.data == null ? 'Save' : 'Update'),
        ),
      ],
    );
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}
