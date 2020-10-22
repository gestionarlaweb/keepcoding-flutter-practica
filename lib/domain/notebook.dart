import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

// with ChangeNotifier (Para avisar del cambio de estado)
class Notebook with ChangeNotifier {
  static final shared = Notebook();

  final List<Note> _notes = [];
  int get length => _notes.length;

// Contructor
  Notebook();
// Datos de prueba
  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(100, (index) => Note("Item $index")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

/* Mutadores*/
// (necesita de la clase de más arriba "with ChangeNotifier")
  bool remove(Note note) {
    //return _notes.remove(note);
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    //return _notes.removeAt(index);
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    // Añadimos el notify
    notifyListeners();
  }

  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }
}
