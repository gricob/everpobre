import 'package:everpobre/Scenes/notes/notebook_list.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF388E3C),
        accentColor: Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      home: NotebookList(model),
    );
  }
}
