import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String? _name;
  String? _ageRange;

  // Getter for the name
  String? get name => _name;

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

  // Method to update the user name
  void updateUserName(String enteredName) {
    _name = enteredName;
    notifyListeners();
  }

  // Method to update the age range
  void updateUserAgeRange(String ageRange) {
    _ageRange = ageRange;
    notifyListeners();
  }

  // This is redundant since the setter already exists, but kept for clarity
  void setAgeRange(String ageRange) {
    _ageRange = ageRange;
    notifyListeners();
  }
}
