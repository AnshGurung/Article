import 'package:flutter/material.dart';
//import 'package:get/get.dart';

// ignore: must_be_immutable
class TextBar extends StatefulWidget {
  TextBar({
    super.key,
    required this.promptText,
    this.tailIcon,
    this.isVisible,
    required this.controller,
    this.leadingIcon,
    required this.errorText,
    required this.keyboardInputType,
  });

  String promptText;
  IconData? tailIcon;
  bool? isVisible;
  TextEditingController controller;
  IconData? leadingIcon;
  String errorText;
  TextInputType keyboardInputType;
  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: widget.keyboardInputType,
        controller: widget.controller,
        obscureText: widget.isVisible ?? false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.leadingIcon),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.isVisible = !widget.isVisible!;
              });
            },
            icon: Icon(widget.tailIcon),
          ),
          hintText: widget.promptText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errorText;
          }
          return null;
        },
      ),
    );
  }
}
