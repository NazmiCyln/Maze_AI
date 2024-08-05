extension StringExtensions on String {
  String get cutLastThreeElements => substring(0, length - 3);

  bool isAlphaNumeric() => RegExp(r'^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])[A-Za-z0-9\s]{5,15}$').hasMatch(this);
}
