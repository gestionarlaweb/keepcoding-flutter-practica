import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

import 'Scenes/notebooks_scene.dart';
import 'domain/note.dart';

final Notebook model = Notebook.testDataBuilder();
final Notebooks models = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF4CAF50),
        accentColor: const Color(0xFF303F9F),
      ),
      debugShowCheckedModeBanner: false,
      title: TextResources.appName,
      // Rutas
      initialRoute: '/',
      routes: {
        '/': (context) => MainWidget(),
        '/detailNotes': (context) => DetailNotes(),
        '/editNote': (context) => EditNotes(),
      },
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      // El NoteListView lista las notas
      body: NotesListView(model),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Inserta nueva nota
          model.add(Note("Una nueva nota"));
          // Y navega a la nueva pantalla
          Navigator.pushNamed(context, '/detailNotes');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("List Notebooks !")),
      appBar: AppBar(
        title: const Text("Notebooks "),
      ),
      body: GestureDetector(
        onTap: () {
          // Inserta nueva nota
          model.add(Note("Una nueva lista"));
          // Y navega a la nueva pantalla
          Navigator.pushNamed(context, '/editNote');
        },
        child: NotebooksListView(models),
      ),
    );
  }
}

class EditNotes extends StatefulWidget {
  @override
  _EditNotesState createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notebooks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nota a editar',
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onSubmitted: (String nota) {},
            ),
            Align(
              child: RaisedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: const Text('Borrar'),
              ),
            ),
            Align(
              child: RaisedButton(
                onPressed: () {
                  // Ir a la ruta / solo si hay texto
                  if (_controller.text.isNotEmpty) {
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: const Text('Actualizar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
