import '../database/tables.dart';

class NotesRepository {
  var database = MyDatabase();

  Future<void> addNote(String title, String content, int color) async {
    await database.into(database.notes).insert(
        NotesCompanion.insert(title: title, content: content, color: color));
  }

  Future<void> deleteNote(Note note) async {
    await database.delete(database.notes).delete(note);
  }

  Future<void> updateNote(Note note) async {
    await database.update(database.notes).replace(note);
  }

  Future<List<Note>> getAllNotes() async {
    return await database.select(database.notes).get();
  }
}
