// lib/controllers/note_controller.dart
import 'package:get/get.dart';
import 'package:to_do_list/model/note_model.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  var searchQuery = ''.obs;
  var selectedCategory = ''.obs;

  void addNote(Note note) {
    notes.add(note);
  }

  void updateNote(Note updatedNote) {
    var index = notes.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      notes[index] = updatedNote;
    }
  }

  void deleteNote(String id) {
    notes.removeWhere((note) => note.id == id);
  }

  List<Note> get filteredNotes {
    return notes.where((note) {
      return (searchQuery.value.isEmpty || note.title.contains(searchQuery.value)) &&
             (selectedCategory.value.isEmpty || note.category == selectedCategory.value);
    }).toList();
  }
}
