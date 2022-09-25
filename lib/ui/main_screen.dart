import 'dart:developer';

import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/ui/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colorsFull = []
      ..add(Colors.green)
      ..add(Colors.orange)
      ..add(Colors.red)
      ..add(Colors.blue)
      ..add(Colors.indigo)
      ..add(Colors.yellow)
      ..add(Colors.lightBlue)
      ..add(Colors.orange)
      ..add(Colors.red)
      ..add(Colors.blue)
      ..add(Colors.indigo)
      ..add(Colors.yellow);

    List<Color> colorsEmpty = [];

    return Scaffold(
      appBar: CustomAppBar(
        onInfoPress: () => log('INFO'),
        onSearchPress: () => log('SEARCH'),
      ),
      body: colorsFull.isEmpty
          ? const NotesEmpty()
          : NotesList(colors: colorsFull),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: CustomColors.trueBlack,
          isExtended: true,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
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
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: colors[index],
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 100,
          margin: const EdgeInsets.only(left: 20, right: 20),
        );
      },
    );
  }
}
