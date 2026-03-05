import 'package:flutter/material.dart';
import 'cards_screen.dart';

class FoldersScreen extends StatelessWidget {
  final List<String> suits = [
    "Hearts",
    "Diamonds",
    "Clubs",
    "Spades",
  ];

  IconData getSuitIcon(String suit) {
    switch (suit) {
      case "Hearts":
        return Icons.favorite;
      case "Diamonds":
        return Icons.change_history;
      case "Clubs":
        return Icons.filter_vintage;
      case "Spades":
        return Icons.eco;
      default:
        return Icons.folder;
    }
  }

  Color getSuitColor(String suit) {
    if (suit == "Hearts" || suit == "Diamonds") {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Organizer"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: suits.length,
        itemBuilder: (context, index) {
          final suit = suits[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardsScreen(suit: suit),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      getSuitIcon(suit),
                      size: 60,
                      color: getSuitColor(suit),
                    ),
                    SizedBox(height: 10),
                    Text(
                      suit,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}