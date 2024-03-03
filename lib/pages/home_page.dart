import 'package:flutter/material.dart';
import 'package:smartCart/components/CardTypeOne.dart';
import 'package:smartCart/pages/addItemDialog.dart';
import 'package:smartCart/sql_helper.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Map<String, dynamic>>> _cardContents;
  Future refresh() async {
    setState(() {
      _cardContents = SQLHelper.getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,

        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),

        automaticallyImplyLeading: false,
        title: Text(
          "Smart Cart",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: GestureDetector(
                  child: Text('Add Item'),
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddItemDialog();
                    },
                  ),
                ),
              ),
            ];
          })
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () {

              //   },
              //   child: Text("+"),
              // ),
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: SQLHelper.getItems(),
                    builder: (context, snapshot) {
                      final List<Map<String, dynamic>> cardContents =
                          snapshot.data ?? [];
                      return RefreshIndicator(
                          child: ListView.builder(
                            itemCount: cardContents.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> content =
                                  cardContents[index];
                              return CardTypeOne(content: content);
                            },
                          ),
                          onRefresh: refresh);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
