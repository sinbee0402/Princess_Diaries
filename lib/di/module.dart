import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class Module {
  @preResolve
  Future<Database> get db => openDatabase(
        'posts_db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE post (id INTEGER PRIMARY KEY AUTOINCREMENT, emoji TEXT, date INTEGER, title TEXT, content TEXT)',
          );
        },
      );
}
