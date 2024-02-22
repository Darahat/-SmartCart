import 'package:flutter/material.dart';

class CardTypeOne extends StatelessWidget {
  Map<String, dynamic> content;

  CardTypeOne({required this.content});

  @override
  Widget build(BuildContext context) {
    print(this.content);
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
                  children: [],
                ),
              ],
            )),
      ),
    );
  }
}
