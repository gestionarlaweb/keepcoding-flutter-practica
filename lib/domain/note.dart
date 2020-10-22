import 'package:everpobre/extensions/date_time.dart';

// Modelo
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

  // Métodos heredados de Object
  @override
  String toString() {
    return "<$runtimeType: $body>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Note &&
          (other.body == body) &&
          (other.creationDate.almostEqual(_creationDate)) &&
          (other.modificationDate.almostEqual(_modificationDate));
    }
  }

  @override
  int get hashCode {
    final proxy = DateTime(
        _creationDate.year,
        _creationDate.month,
        _creationDate.day,
        _creationDate.hour,
        _creationDate.minute,
        _creationDate.second);
    return proxy.hashCode;
  }
}
