import 'package:app_client/blocs/notes_cubit.dart';
import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/database/tables.dart';
import 'package:app_client/ui/appbar/add_note_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteAddScreen extends StatelessWidget {
  NoteAddScreen({super.key});
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NotesCubit>();
    void saveNote() {
      if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
        cubit.addNotetoDB(
            _titleController.text, _bodyController.text, Colors.red.value);

        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AddNoteAppBar(
        onCustomPress: () => {},
        onSavePress: () => {saveNote()},
        onColorChangePress: () =>
            {cubit.getAllNotes().then((value) => print(value))},
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
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
