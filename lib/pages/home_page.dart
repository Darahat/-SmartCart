import 'package:flutter/material.dart';
import 'package:smartCart/components/CardTypeOne.dart';
import 'package:smartCart/pages/addItemDialog.dart';

class HomePage extends StatelessWidget {
  final List<String> cardContents = [
    'Card 1 content',
    'Card 2 content',
    'Card 3 content',
    'Card 4 content',
    'Card 1 content',
    'Card 2 content',
    'Card 3 content',
    'Card 4 content',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Add Item",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddItemDialog();
                    },
                  );
                },
                child: Text("+"),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (String content in cardContents)
                      CardTypeOne(content: content),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
