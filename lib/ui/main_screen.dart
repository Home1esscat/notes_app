import 'dart:developer';

import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/ui/appbar/main_app_bar.dart';
import 'package:app_client/ui/add_note_screen.dart';
import 'package:app_client/ui/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colorsFull = [
      Colors.pink,
      Colors.yellow,
      Colors.orange,
      Colors.indigo,
      Colors.teal,
      Colors.lime
    ];

    return Scaffold(
      appBar: MainAppBar(
        onInfoPress: () => openDialog(context),
        onSearchPress: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        ),
      ),
      body: colorsFull.isEmpty
          ? const NotesEmpty()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: NotesList(colors: colorsFull),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 16),
        child: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NoteAddScreen(),
              ),
            ),
          },
          elevation: 24,
          backgroundColor: CustomColors.trueBlack,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }

  Future openDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SizedBox(
                width: 330,
                height: 236,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Made by - Home1esscat',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Designed by - Notes App UI',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Illustrations - www.storyset.com',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Icons - Android Native',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Font - Nunito-Regular',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class NotesEmpty extends StatelessWidget {
  const NotesEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/no_data.png'),
          const Text(
            'Create your first note!',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class NotesList extends StatelessWidget {
  const NotesList({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          child: Dismissible(
            confirmDismiss: (DismissDirection direction) async {
              return await showDeleteDialog(context);
            },
            key: ValueKey(index),
            direction: DismissDirection.horizontal,
            background: Container(
              color: CustomColors.deepRed,
              height: 100,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child:
                    Icon(Icons.delete_rounded, size: 36, color: Colors.white),
              ),
            ),
            child: Container(
              color: colors[index],
              height: 100,
            ),
          ),
        );
      },
    );
  }

  Future showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Are you sure you wish to delete this note?",
            style: TextStyle(fontSize: 19),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                "DELETE",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                "CANCEL",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
