import 'package:flutter/material.dart';

class TouchBlocker extends StatelessWidget {
  const TouchBlocker({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width; 
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      color: Colors.transparent,
    );
  }
}