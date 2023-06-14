class User {
  static final User instance = User._('', '');

  User._(this._email, this._password);

  String _email;
  String _password;

  String getEmail() {
    return _email;
  }

  void setEmail(email) {
    _email = email;
  }

  String getPassword() {
    return _password;
  }

  void setPassword(password) {
    _password = password;
  }
}
