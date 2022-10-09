import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/repository/notes_repository.dart';
import 'package:app_client/ui/appbar/add_note_app_bar.dart';
import 'package:flutter/material.dart';

class NoteAddScreen extends StatelessWidget {
  NoteAddScreen({super.key});
  final _titleContriller = TextEditingController();
  final _bodyController = TextEditingController();
  NotesRepository repo = NotesRepository();

  @override
  Widget build(BuildContext context) {
    void saveNote() {
      if (_titleContriller.text.isNotEmpty && _bodyController.text.isNotEmpty) {
        repo.createNote(
            _titleContriller.text, _bodyController.text, Colors.pink);
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AddNoteAppBar(
          onSavePress: () => {saveNote()},
          onColorChangePress: () => {
                repo.getAllNotes().then(
                      (value) => print(value),
                    ),
              }),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleContriller,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  fillColor: CustomColors.darkGrey,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 38),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _bodyController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Type something...',
                  fillColor: CustomColors.darkGrey,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
