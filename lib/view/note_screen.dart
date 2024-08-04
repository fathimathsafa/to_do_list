// lib/views/add_note_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/controller/note_controller.dart';
import 'package:to_do_list/model/note_model.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatelessWidget {
  final Note? note;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  AddNoteScreen({this.note}) {
    if (note != null) {
      titleController.text = note!.title;
      contentController.text = note!.content;
      categoryController.text = note!.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find();

    return Scaffold(
      backgroundColor: Color(0xFFF987D9A),
      appBar: AppBar(
        backgroundColor: Color(0xFFF987D9A),
        title: Text(
          note == null ? 'ADD NOTE' : 'EDIT YOUR NOTE',
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                  labelText: 'Content',
                  labelStyle: TextStyle(color: Colors.white)),
              maxLines: 5,
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final id = note?.id ?? DateTime.now().toString();
                final newNote = Note(
                  id: id,
                  title: titleController.text,
                  content: contentController.text,
                  dateTime: DateTime.now(),
                  category: categoryController.text,
                );

                if (note == null) {
                  noteController.addNote(newNote);
                } else {
                  noteController.updateNote(newNote);
                }

                Get.back();
              },
              child: Text(
                note == null ? 'ADD NOTE' : 'UPDATE NOTE',
                style: TextStyle(color: Color(0xFFF987D9A)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
