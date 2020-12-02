class Song {
  String _name;
  String _aName;
  String _url;
  String _audioURL;

  String get audioURL => _audioURL;

  set audioURL(String value) {
    _audioURL = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get aName => _aName;

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  set aName(String value) {
    _aName = value;
  }

  @override
  String toString() {
    return 'Song{_name: $_name, _aName: $_aName, _url: $_url}';
  }
}
