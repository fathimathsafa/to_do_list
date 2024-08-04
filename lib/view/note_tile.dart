// lib/views/note_tile.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/note_controller.dart';
import 'package:to_do_list/model/note_model.dart';
import 'package:to_do_list/view/note_screen.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  NoteTile({required this.note});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find();

    return ListTile(
      title: Text(
        note.title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text('${note.content}\n${note.dateTime}',
          style: TextStyle(color: Colors.white)),
      onTap: () => Get.to(AddNoteScreen(note: note)),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () => noteController.deleteNote(note.id),
      ),
    );
  }
}
