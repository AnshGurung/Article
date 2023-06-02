import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TagHolder extends StatelessWidget {
  TagHolder({
    super.key,
    required this.tag,
  });

  String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor1,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
