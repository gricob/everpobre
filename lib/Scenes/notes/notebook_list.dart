
import 'package:everpobre/domain/notebooks.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return NotebookListItem(widget._model, index);
      }
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
          leading: const Icon(Icons.library_books),
          title: Text(widget.notebooks[widget.index].title)
        ),
      ),
    );
  }
}