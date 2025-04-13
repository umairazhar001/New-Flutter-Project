import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/widgets/customer_text_field.dart';
import '../providers/auth_provider.dart';
import 'auth_success_screen.dart';
import 'login_screen.dart'; // Import the LoginScreen

class SignupScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);
    final authController = ref.read(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey[200], // Light background color
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: 'Name',
                      value: form.name,
                      onChanged: (v) => formNotifier.updateField('name', v),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email',
                      value: form.email,
                      error: form.emailError,
                      onChanged: (v) => formNotifier.updateField('email', v),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Password',
                      value: form.password,
                      error: form.passwordError,
                      obscure: true,
                      onChanged: (v) => formNotifier.updateField('password', v),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Confirm Password',
                      value: form.confirmPassword,
                      error: form.confirmPasswordError,
                      obscure: true,
                      onChanged: (v) =>
                          formNotifier.updateField('confirmPassword', v),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (formNotifier.validateSignup()) {
                          authController.signup(
                            form.name,
                            form.email,
                            form.password,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AuthSuccessScreen()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}