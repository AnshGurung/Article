import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

class SignupMessage extends StatelessWidget {
  const SignupMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Login',
            style: TextStyle(
              color: primaryColor1,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
