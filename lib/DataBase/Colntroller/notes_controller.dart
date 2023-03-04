import 'package:note_app/DataBase/db_settings.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesDBController {
  final Database _myDb = DbSettings().getDatabase;
  Future<int> createNote(NoteModel note) async {
    var result =
        await _myDb.rawQuery('SELECT * FROM note WHERE title ="${note.title}"');
    if (result.isEmpty) {
      return await _myDb.insert('note', note.toMap());
    }
    return 0;
  }

  Future<List<NoteModel>> readNote() async {
    /// Read All Rows
    var rowsMap = await _myDb.query('note');
    return rowsMap.map((row) => NoteModel.fromMap(row)).toList();
  }

  Future<NoteModel?> showNote(int id) async {
    /// Read One Row By Id
    var rowMap = await _myDb.rawQuery('SELECT * FROM note WHERE id = "$id"');
    rowMap.isNotEmpty ? NoteModel.fromMap(rowMap.first) : null;

    // if (rowMap.isNotEmpty) {
    //   return NoteModel.fromMap(rowMap.first);
    // } else {
    //   return null;
    // }
  }

  Future<bool> updateNote(NoteModel note) async {
   var result = await _myDb
        .update('note', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
    return result > 0;
  }

  Future<bool> deleteNote(int id) async {
    var result = await _myDb.delete(
        'note',
        where: 'id = ?',
        whereArgs: [id]
    );
    return result > 0;
  }
}
