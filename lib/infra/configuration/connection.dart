import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), "stockDatabase");
      // deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, dbVersion) {
        db.execute("""
CREATE TABLE stock(
id INTEGER PRIMARY KEY AUTOINCREMENT
, name VARCHAR (255) NOT NULL
, quantity INTEGER NOT NULL
, create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
, status CHAR(1) NOT NULL DEFAULT 'A'
);
""");
      });
    }
    return _db;
  }
}
