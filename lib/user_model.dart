import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String? _name;
  String? _ageRange;

  // Getter for the name
  String? get name => _name;

  get userName => null;

  // Setter for the name
  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  // Getter for the age range
  String? get ageRange => _ageRange;

  // Setter for the age range
  set ageRange(String? value) {
    _ageRange = value;
    notifyListeners();
  }

  void updateUserAgeRange(String ageRange) {}

  void updateUserName(String enteredName) {}

  void setAgeRange(String ageRange) {}
}
