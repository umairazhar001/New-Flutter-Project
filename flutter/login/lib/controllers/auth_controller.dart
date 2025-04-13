
// lib/controllers/auth_controller.dart
// import '../models/user_model.dart';

// class AuthController {
//   UserModel? _user;

//   UserModel? get user => _user;

//   bool login(String email, String password) {
//     return _user != null && _user!.email == email && _user!.password == password;
//   }

//   void signup(String name, String email, String password) {
//     _user = UserModel(name: name, email: email, password: password);
//   }
// }
import '../models/user_model.dart';

class AuthController {
  // Mock database to store multiple users
  final List<UserModel> _users = [];

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  // Login method
  bool login(String email, String password) {
    // Check if the user exists in the database
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      _currentUser = user; // Set the logged-in user
      return true; // Login successful
    } catch (e) {
      return false; // Login failed (user not found)
    }
  }

  // Signup method
  bool signup(String name, String email, String password) {
    // Check if the email is already registered
    final existingUser = _users.any((user) => user.email == email);
    if (existingUser) {
      return false; // Signup failed (email already exists)
    }

    // Add the new user to the database
    final newUser = UserModel(name: name, email: email, password: password);
    _users.add(newUser);
    return true; // Signup successful
  }

  // Logout method
  void logout() {
    _currentUser = null; // Clear the logged-in user
  }
}

