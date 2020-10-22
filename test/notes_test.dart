import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construcción", () {
    // Aquí meto los tests
    test("Can create Notes", () {
      expect(Note("A new note"), isNotNull);
      expect(Note.empty().body, "");
    });
  });

  group("dates", () {
    test("Modificar date", () {
      final n1 = Note.empty();
      n1.body = "Texto nuevo";

      expect(n1.creationDate.isBefore(n1.modificationDate), isTrue);
    });
  });

  group("Object protocol", () {
    test("equality", () {
      final n = Note("Mi nota");
      expect(n, n);
      expect(n, Note("Mi nota"));
      expect(n != Note.empty(), isTrue);
    });
    test("hashCode", () {
      // dos objetos que son iguales han de tener el mismo HashCode
      final n1 = Note("Mi nota");
      final n2 = Note("Mi nota");
      expect(n1.hashCode, n2.hashCode);
    });
  });
}
