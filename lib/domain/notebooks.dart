import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  Notebooks();

  Notebooks.testDataBuilder() {
    _notebooks.addAll(List.generate(10, (index) => Notebook.testDataBuilder("Notebook $index")));
  }

  Notebook operator [](int index) {
    return _notebooks[index];
  }

  Notebook removeAt(int index) {
    final Notebook notebook = _notebooks.removeAt(index);
    notifyListeners();
    return notebook;
  }

  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }
}