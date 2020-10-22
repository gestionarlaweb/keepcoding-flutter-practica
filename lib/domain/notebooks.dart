import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

// PRACTICA
class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Note> _notes = [];

  int get length => _notes.length;

// Contructor
  Notebooks();
// Datos de prueba
  Notebooks.testDataBuilder() {
    _notes
        .addAll(List.generate(10, (index) => Note("Tarea de la nota $index")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

/* Mutadores*/
// (necesita de la clase de más arriba "with ChangeNotifier")
  bool remove(Note notes) {
    //return _notes.remove(notes);
    final n = _notes.remove(notes);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    //return _notes.removeAt(index);
    return n;
  }

  void add(Note notes) {
    _notes.insert(0, notes);
    notifyListeners();
  }

  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }
}
