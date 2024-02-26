import 'package:flutter/material.dart';
import 'package:smartCart/pages/addItemDialog.dart';
import 'package:smartCart/sql_helper.dart';

class CardTypeOne extends StatelessWidget {
  Map<String, dynamic> content;

  CardTypeOne({required this.content});

  @override
  Widget build(BuildContext context) {
    print(this.content.length);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/banana.jpg',
                      width: 50.0,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      content['title'] ?? '',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      content['description'] ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          SQLHelper.deleteItem(content['id'], 'items');
                        },
                        icon: Icon(Icons.delete)),
                    IconButton(
                        onPressed: () {
                          // Future<List<Map<String, dynamic>>> data =
                          //     SQLHelper.getItem(content['id']);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddItemDialog(data: content);
                            },
                          );
                        },
                        icon: Icon(Icons.edit))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
