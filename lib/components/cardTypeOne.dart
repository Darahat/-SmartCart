import 'package:flutter/material.dart';

class CardTypeOne extends StatelessWidget {
  final String content;

  const CardTypeOne({required this.content});

  @override
  Widget build(BuildContext context) {
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
                      content,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
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
