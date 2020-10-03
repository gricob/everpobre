
import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/text_resources.dart';
import 'package:everpobre/domain/notebook.dart';

class NotebookList extends StatefulWidget {
  final Notebooks _model;

  const NotebookList(Notebooks model): _model = model;

  @override
  State<StatefulWidget> createState() => NotebookListState();
}

class NotebookListState extends State<NotebookList> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      body: ListView.builder(
          itemCount: widget._model.length,
          itemBuilder: (context, index) {
            return NotebookListItem(widget._model, index);
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget._model.add(Notebook("New notebook"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotebookListItem extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NotebookListItem(this.notebooks, this.index);

  @override
  NotebookListItemState createState() => NotebookListItemState();
}

class NotebookListItemState extends State<NotebookListItem> {

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);

        Scaffold.of(context).showSnackBar(
          const SnackBar(content: Text("Notebook has been deleted!"))
        );
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
            onTap: () {
              Navigator.push<MaterialPageRoute>(context, MaterialPageRoute(
                builder: (context) => NotesListView(widget.notebooks[widget.index])
              )
            );
          },
          leading: const Icon(Icons.library_books),
          title: Text(widget.notebooks[widget.index].title)
        ),
      ),
    );
  }
}