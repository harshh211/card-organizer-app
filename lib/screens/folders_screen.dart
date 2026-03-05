import 'package:flutter/material.dart';
import '../repositories/folder_repository.dart';
import '../models/folder.dart';
import 'cards_screen.dart';

class FoldersScreen extends StatefulWidget {
  const FoldersScreen({super.key});

  @override
  State<FoldersScreen> createState() => _FoldersScreenState();
}

class _FoldersScreenState extends State<FoldersScreen> {

  final FolderRepository repository = FolderRepository();
  List<Folder> folders = [];

  @override
  void initState() {
    super.initState();
    loadFolders();
  }

  void loadFolders() async {
    final data = await repository.getFolders();

    setState(() {
      folders = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Folders"),
      ),
      body: ListView.builder(
        itemCount: folders.length,
        itemBuilder: (context, index) {

          final folder = folders[index];

          return ListTile(
            title: Text(folder.folderName),

            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CardsScreen(folder: folder),
                ),
              );
            },
          );
        },
      ),
    );
  }
}