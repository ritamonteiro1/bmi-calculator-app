class UserModel {
  UserModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  late double _height;
  late double _weight;

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }
}
