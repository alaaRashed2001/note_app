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

  /// DELETE
  void deleteNote(int id) {
    allNotes.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
