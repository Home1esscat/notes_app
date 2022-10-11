import 'package:app_client/blocs/notes_state.dart';
import 'package:app_client/repository/notes_repository.dart';
import 'package:bloc/bloc.dart';

import '../database/tables.dart';

class NotesCubit extends Cubit<NotesState> {
  final NotesRepository _repository = NotesRepository();

  NotesCubit() : super(const NotesState(currentNotes: <Note>[])) {
    _initialize();
  }

  Future<void> _initialize() async {
    //final notes = await _repository.getAllNotes();
    final newNotes = state.copyWith(_repository.getAllNotes());
    emit(newNotes);
  }

  Future<void> addNotetoDB(String title, String content, int color) async {
    await _repository.addNote(title, content, color);
    final newNotes = state.copyWith(_repository.getAllNotes());
    emit(newNotes);
  }

  Future<List<Note>> getAllNotes() async {
    return await _repository.getAllNotes();
  }
}
