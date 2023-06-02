import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextBox extends StatelessWidget {
  
  TextBox({
    super.key,
    required this.hintText,
  });
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff92865C).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: secondaryColor,
        ),
      ),
    );
  }
}
