import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

class LoginMessage extends StatelessWidget {
  const LoginMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'New here? ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Create an account',
            style: TextStyle(
              color: primaryColor1,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
