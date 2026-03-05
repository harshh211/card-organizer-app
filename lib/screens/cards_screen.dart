import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  final String suit;

  const CardsScreen({super.key, required this.suit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$suit Cards"),
      ),
      body: Center(
        child: Text(
          "Cards inside $suit folder will appear here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}