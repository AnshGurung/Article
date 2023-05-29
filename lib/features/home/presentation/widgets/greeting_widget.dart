import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String greetings = '';

    if (now.hour < 12) {
      greetings = 'Good morning';
    } else if (now.hour < 17) {
      greetings = 'Good afternoon';
    } else {
      greetings = 'Good evening';
    }
    return Text(
      greetings,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
