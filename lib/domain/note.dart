class Note {
  // Fields
  String _body = "";

  String get body => _body;
  set body(String newValue) {
    _body = newValue;
    _modificationDate = DateTime.now();
  }

  DateTime _creationDate;
  DateTime get creationDate => _creationDate;
  DateTime _modificationDate;
  DateTime get modificationDate => _modificationDate;

  // Constructores
  Note(String contents) : _body = contents {
    _modificationDate = DateTime.now();
    _creationDate = DateTime.now();
  }

  Note.empty() : this("");

  // Deberes
  /* Métodos heredados de Object
  * toString()
  * ==
  * hashCode, sabiendo que: dos objetos iguales tienen el mismo hashCode
  */

  /* Encasquetar ChangeNotifier y llamar a notifyListeners() cuando algo cambia
  */

}
