import 'package:flutter/material.dart';

import 'appbar/show_note_app_bar.dart';

class ShowNoteScreen extends StatelessWidget {
  const ShowNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowNoteAppBar(
        onCustomPress: () => {},
      ),
      body: Container(color: Colors.red),
    );
  }
}
