import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatefulWidget {
  final Notebook _model;

  const NotesListView(Notebook model) : _model = model;

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

// Este (State) nos va a dar de alta en las notificaciones
class _NotesListViewState extends State<NotesListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  // darse de alta
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  // darse de baja
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Al detectar un clic en la lista te vas a la Clase DetailNotes
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return NoteSliver(widget._model, index);
      },
    );
  }
}

class NoteSliver extends StatefulWidget {
  final Notebook notebook;
  final int index;

  const NoteSliver(Notebook notebook, int index)
      // ignore: prefer_initializing_formals
      : notebook = notebook,
        // ignore: prefer_initializing_formals
        index = index;

  @override
  _NoteSliverState createState() => _NoteSliverState();
}

class _NoteSliverState extends State<NoteSliver> {
  @override
  Widget build(BuildContext context) {
    final DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebook.removeAt(widget.index);
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Element has been deleted !"),
          ),
        );

        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Element has been deleted !"),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.toc),
          title: Text(widget.notebook[widget.index].body),
          subtitle:
              Text(fmt.format(widget.notebook[widget.index].modificationDate)),
        ),
      ),
    );
  }
}
