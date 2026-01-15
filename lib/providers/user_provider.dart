import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  void login(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  // For demo purposes - in real app, this would connect to backend
  Future<bool> authenticate(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // For demo, accept any email/password combination
    if (email.isNotEmpty && password.isNotEmpty) {
      final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'مستخدم تجريبي',
        phone: '0501234567',
        address: 'الرياض، المملكة العربية السعودية',
        email: email,
        password: password, // In real app, this should be hashed
      );
      login(user);
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String phone, String address, String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    if (name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        phone: phone,
        address: address,
        email: email,
        password: password, // In real app, this should be hashed
      );
      login(user);
      return true;
    }
    return false;
  }
}
