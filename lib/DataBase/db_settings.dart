import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbSettings {
  late Database _database;
  static final DbSettings _instance = DbSettings._internal();
  factory DbSettings() {
    return _instance;
  }
  DbSettings._internal();

  Database get getDatabase => _database;

  Future<void> initDatabase() async {
    try {
      Directory getDirectory = await getApplicationDocumentsDirectory();
      print('getDirectory');
      print(getDirectory);
      String path = join(getDirectory.path, 'notes.sql');
      // await deleteDatabase(path);  /// temporary
      _database = await openDatabase(
          path,
          version: 1,
          onCreate: (Database db, int version) {
            print(db.path);
            db.execute('CREATE TABLE note ('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'title Text NOT NULL,'
                'subTitle Text NOT NULL,'
                'color INTEGER NOT NULL,'
                'date Text'
                ')'
              );
          }
      );
    }  catch (e) {
      print('Error=>${e.toString()}');
    }
  }
}
