import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String? _name;
  String? _ageRange;
  bool _dailyNotificationsEnabled = false; // Default value

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

  // Getter for daily notifications
  bool get dailyNotificationsEnabled => _dailyNotificationsEnabled;

  // Method to toggle daily notifications
  void toggleDailyNotifications(bool value) {
    _dailyNotificationsEnabled = value;
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

  // Method to explicitly set age range (kept for clarity)
  void setAgeRange(String ageRange) {
    _ageRange = ageRange;
    notifyListeners();
  }
}
