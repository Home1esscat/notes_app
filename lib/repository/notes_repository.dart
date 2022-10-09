import 'dart:ui';

import 'package:flutter/material.dart';

import '../database/tables.dart';

class NotesRepository {
  final database = MyDatabase();

  //Create
  Future<void> createNote(String title, String content, Color color) async {
    await database.into(database.notes).insert(NotesCompanion.insert(
        title: title, content: content, color: color.value));
  }

  Future<List<Note>> getAllNotes() async {
    final allNotes = await database.select(database.notes).get();
    return allNotes;
  }
}
