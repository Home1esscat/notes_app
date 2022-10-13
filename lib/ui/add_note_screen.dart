import 'package:app_client/blocs/notes_cubit.dart';
import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/ui/appbar/add_note_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteAddScreen extends StatelessWidget {
  NoteAddScreen({super.key});
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var notesCubit = context.read<NotesCubit>();
    int tempColorSelected = CustomColors.lightGrey.value;

    void addNote() {
      if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
        notesCubit.addNote(
            _titleController.text, _bodyController.text, tempColorSelected);
        Navigator.pop(context);
      }
    }

    Future changeColor(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            width: 210,
            height: 110,
            child: GridView.builder(
              itemCount: CustomColors.colorsData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () => {
                      tempColorSelected = CustomColors.colorsData[index].value,
                      Navigator.pop(context)
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Ink(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        color: CustomColors.colorsData[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AddNoteAppBar(
        onCustomPress: () => {},
        onSavePress: () => {addNote()},
        onColorChangePress: () => {changeColor(context)},
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
