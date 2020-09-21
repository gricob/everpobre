import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construction", () {
    // Aquí metoi los test
    test("Can create notes", () {
      expect(Note("a new note"), isNotNull);
      expect(Note.empty().body, "");
    });
  });

  group("dates", () {
    test("Modification is bigger than creation after modification", () {
      var n1 = Note.empty();
      n1.body = "Texto nuevo";

      expect(n1.creationDate.isBefore(n1.modificationDate), isTrue);
    });
  });

  group("Object Protocol", () {
    test("equality", () {
      var n = Note("Mi nota");
      expect(n, n);
      expect(n, Note("Mi nota"));
      expect(n != Note.empty(), isTrue);
    });

    test("hashCode", () {
      // dos objetos que son iguales, han de tener el mismo
      // hashCode
      var n1 = Note("Mi nota");
      var n2 = Note("Mi nota");

      expect(n1.hashCode, n2.hashCode);
    });
  });
}
