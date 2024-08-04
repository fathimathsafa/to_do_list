// lib/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/controller/note_controller.dart';
import 'package:to_do_list/view/note_screen.dart';
import 'note_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find();

    return Scaffold(
      backgroundColor: Color(0xFFF987D9A),
      appBar: AppBar(
        backgroundColor: Color(0xFFF987D9A),
        centerTitle: true,
        title: Text(
          'TO DO LIST',
          style: GoogleFonts.oswald(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => Get.to(AddNoteScreen()),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
              onChanged: (value) => noteController.searchQuery.value = value,
            ),
          ),
          Expanded(
            child: Obx(() {
              var notes = noteController.filteredNotes;
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteTile(note: notes[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
