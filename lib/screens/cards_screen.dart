import 'package:flutter/material.dart';
import '../models/folder.dart';
import '../repositories/card_repository.dart';
import '../models/card.dart';

class CardsScreen extends StatefulWidget {

  final Folder folder;

  const CardsScreen({super.key, required this.folder});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  final CardRepository repository = CardRepository();

  List<PlayingCard> cards = [];

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  void loadCards() async {

    final data = await repository.getCardsByFolder(widget.folder.id!);

    setState(() {
      cards = data;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.folder.folderName),
      ),

      body: ListView.builder(
        itemCount: cards.length,

        itemBuilder: (context, index) {

          final card = cards[index];

          return ListTile(
            leading: Image.asset(
              "assets/cards/AS.png",
              width: 40,
            ),

            title: Text(card.cardName),
            subtitle: Text(card.suit),
          );
        },
      ),
    );
  }
}