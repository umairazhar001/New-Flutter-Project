
// lib/providers/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/controllers/auth_controller.dart';

final authControllerProvider = Provider<AuthController>((ref) => AuthController());

final authFormProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>((ref) => AuthFormNotifier());

class AuthFormState {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  AuthFormState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.name = '',
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  AuthFormState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return AuthFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}

class AuthFormNotifier extends StateNotifier<AuthFormState> {
  AuthFormNotifier() : super(AuthFormState());

  void updateField(String key, String value) {
    switch (key) {
      case 'email':
        state = state.copyWith(email: value);
        break;
      case 'password':
        state = state.copyWith(password: value);
        break;
      case 'confirmPassword':
        state = state.copyWith(confirmPassword: value);
        break;
      case 'name':
        state = state.copyWith(name: value);
        break;
    }
  }

  bool validateSignup() {
    bool isValid = true;
    String? emailError, passwordError, confirmPasswordError;

    if (!state.email.contains('@')) {
      emailError = 'Invalid email format';
      isValid = false;
    }
    if (state.password.length < 6) {
      passwordError = 'Password must be at least 6 characters';
      isValid = false;
    }
    if (state.confirmPassword != state.password) {
      confirmPasswordError = 'Passwords do not match';
      isValid = false;
    }

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );

    return isValid;
  }
}

