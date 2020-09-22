import 'package:everpobre/domain/note.dart';

class Notebook {
  static final shared = Notebook();

  final List<Note> _notes = [];

  int get length => _notes.length;

  bool remove(Note note) {
    return _notes.remove(note);
  }

  void add(Note note) {
    _notes.insert(0, note);
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }
}
