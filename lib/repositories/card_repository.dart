import '../database/database_helper.dart';
import '../models/card.dart';

class CardRepository {

  Future<List<PlayingCard>> getCardsByFolder(int folderId) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'cards',
      where: 'folder_id = ?',
      whereArgs: [folderId],
    );

    return result.map((json) => PlayingCard.fromMap(json)).toList();
  }

  Future<int> insertCard(PlayingCard card) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert('cards', card.toMap());
  }

  Future<int> deleteCard(int id) async {
    final db = await DatabaseHelper.instance.database;

    return await db.delete(
      'cards',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}