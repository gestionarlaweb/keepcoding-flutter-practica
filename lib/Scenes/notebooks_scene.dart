import 'package:everpobre/domain/notebooks.dart';
import 'package:flutter/material.dart';

class NotebooksListView extends StatefulWidget {
  final Notebooks _models;

  const NotebooksListView(Notebooks models) : _models = models;

  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  void modelDidChange() {
    // Redibujar el Widget
    setState(() {});
  }

// Al conectar el Widget me doy de alta
  @override
  void didChangeDependencies() {
    widget._models.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  // Al irme me doy de baja
  @override
  void dispose() {
    widget._models.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._models.length,
      itemBuilder: (context, index) {
        //return Text(_models[index].body);
        return BookSliver(widget._models, index);
      },
    );
  }
}

class BookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const BookSliver(Notebooks notebooks, int index)
      // ignore: prefer_initializing_formals
      : notebooks = notebooks,
        // ignore: prefer_initializing_formals
        index = index;

  @override
  _BookSliverState createState() => _BookSliverState();
}

class _BookSliverState extends State<BookSliver> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);
        // Mensaje
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Element has been deleted !"),
          ),
        );
        // setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        // Diseño de la lista
        leading: const Icon(Icons.done),
        title: Text(widget.notebooks[widget.index].body),
      ),
    );
  }
}
