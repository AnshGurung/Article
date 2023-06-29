import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextBox extends StatelessWidget {
  TextBox({
    super.key,
    required this.hintText,
    this.maxLines,
    required this.textController,
  });
  String hintText;
  int? maxLines;
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: textController,
        maxLines: maxLines,
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
