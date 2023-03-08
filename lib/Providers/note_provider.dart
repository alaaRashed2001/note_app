import 'package:flutter/foundation.dart';

import '../Models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> allNotes = [];

  /// SET NOTES
  void setNotes(List<NoteModel> notes) {
    allNotes = notes;
    notifyListeners();
  }

  /// CREATE
  void addNote(NoteModel note) {
    allNotes.add(note);
    notifyListeners();
  }

  /// Update
  void updateNote(NoteModel note) {
    int index = allNotes.indexWhere((element) => element.id == note.id);
    allNotes.removeAt(index);
    allNotes.insert(index, note);
    notifyListeners();
  }

  /// DELETE
  void deleteNote(int id) {
    allNotes.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
