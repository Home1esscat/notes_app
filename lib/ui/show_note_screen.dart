import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';
import '../database/tables.dart';
import 'appbar/show_note_app_bar.dart';

class ShowNoteScreen extends StatelessWidget {
  ShowNoteScreen({super.key, required this.note});

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  Note note;

  @override
  Widget build(BuildContext context) {
    _titleController.text = note.title;
    _bodyController.text = note.content;

    return Scaffold(
      appBar: ShowNoteAppBar(
        color: note.color,
        onColorChangePress: () => {},
      ),
      body: WillPopScope(
        onWillPop: () async {
          return await saveChanges(context);
        },
        child: SingleChildScrollView(
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
                    fillColor: CustomColors.darkGrey,
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> saveChanges(BuildContext context) async {
    print('Backpress detected');
    Navigator.pop(context);
    return false;
  }
}
