import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatelessWidget {
  final Notebook _model;

  const NotesListView(Notebook model) : _model = model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        return NoteSliver(_model, index);
      },
    );
  }
}

class NoteSliver extends StatelessWidget {
  final Notebook notebook;
  final int index;

  const NoteSliver(Notebook notebook, int index)
      : this.notebook = notebook,
        this.index = index;

  @override
  Widget build(BuildContext context) {
    DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Card(
      child: ListTile(
        leading: const Icon(Icons.toc),
        title: Text(notebook[index].body),
        subtitle: Text(fmt.format(notebook[index].modificationDate)),
      ),
    );
  }
}
