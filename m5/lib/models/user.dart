class User {
  String _userid;
  String _password;
  String _email;
  String _phone;
  String photo;
  User() {}
  User.takeUser(this._userid, this._password, this._email, this._phone);
  String toString() {
    return "Userid " + _userid + " Email " + _email + " Phone " + _phone;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get userid => _userid;

  set userid(String value) {
    _userid = value;
  }
}
