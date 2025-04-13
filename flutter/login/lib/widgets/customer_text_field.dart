
// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String value;
  final String? error;
  final ValueChanged<String> onChanged;
  final bool obscure;

  const CustomTextField({
    required this.label,
    required this.value,
    this.error,
    required this.onChanged,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscure,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
