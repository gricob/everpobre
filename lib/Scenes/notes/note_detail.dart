import 'package:everpobre/domain/note.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  final Note note;
  final VoidCallback onNoteChanged;

  const NoteDetail({this.note, this.onNoteChanged});

  @override
  State createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  TextEditingController _noteEditingController;

  @override
  void initState() {
    super.initState();

    _noteEditingController = TextEditingController.fromValue(
      TextEditingValue(text: widget.note.body)
    );

    _noteEditingController.addListener(() {
      widget.note.body = _noteEditingController.text;
      widget.onNoteChanged?.call();
    });
  }

  @override
  void dispose() {
    _noteEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.editNote),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: TextField(
          controller: _noteEditingController,
        ),
      ),
    );
  }
}