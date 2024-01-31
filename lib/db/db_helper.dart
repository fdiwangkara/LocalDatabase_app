import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String _dbPath = "note_db.db";
  static Database? _db;

  static Future<void> initDb() async {
    var dir = await getDatabasesPath();
    _db = await openDatabase("$dir/$_dbPath",
        onCreate: (Database db, int version) async {
      await db.execute("""CREATE TABLE Notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT
        );
      """);
    }, version: 1);
  }

  static Database getDb() {
    if (_db == null) {
      throw Error();
    }

    return _db!;
  }
}
