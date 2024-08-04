// lib/models/note.dart
class Note {
  String id;
  String title;
  String content;
  DateTime dateTime;
  String category;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.dateTime,
    required this.category,
  });
}
