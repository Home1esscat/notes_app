import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/ui/appbar/add_note_app_bar.dart';
import 'package:flutter/material.dart';

class NoteAddScreen extends StatelessWidget {
  const NoteAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AddNoteAppBar(onSavePress: () => {}, onColorChangePress: () => {}),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextField(
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Title',
                  fillColor: CustomColors.darkGrey,
                ),
                style: TextStyle(color: Colors.white, fontSize: 38),
              ),
              SizedBox(height: 14),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Type something...',
                  fillColor: CustomColors.darkGrey,
                ),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
