import '../database/database_helper.dart';
import '../models/folder.dart';
import 'package:sqflite/sqflite.dart';

class FolderRepository {
  Future<List<Folder>> getFolders() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('folders', orderBy: 'folder_name');

    return result.map((json) => Folder.fromMap(json)).toList();
  }

  Future<int> insertFolder(Folder folder) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert('folders', folder.toMap());
  }

  Future<int> deleteFolder(int id) async {
    final db = await DatabaseHelper.instance.database;

    return await db.delete(
      'folders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}