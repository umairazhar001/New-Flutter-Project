import '../models/user_model.dart';

class AuthController {
  
  final List<UserModel> _users = [];

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  bool login(String email, String password) {
    
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      _currentUser = user; 
      return true; 
    } catch (e) {
      return false; 
    }
  }

  bool signup(String name, String email, String password) {
  
    final existingUser = _users.any((user) => user.email == email);
    if (existingUser) {
      return false; 
    }

    final newUser = UserModel(name: name, email: email, password: password);
    _users.add(newUser);
    return true; 
  }

  void logout() {
    _currentUser = null; 
  }
}

