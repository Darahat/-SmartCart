import 'package:flutter/material.dart';
import 'package:smartCart/components/CardTypeOne.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> cardContents = [
    'Card 1 content',
    'Card 2 content',
    'Card 3 content',
    'Card 4 content',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          automaticallyImplyLeading: false,
          title: const Text(
            "Items",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Add Item +",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              for (var content in cardContents)
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: CardTypeOne(content: content))
            ]),
          ),
        ));
  }
}
