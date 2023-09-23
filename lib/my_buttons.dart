import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  String name;
  VoidCallback onPressed;
  myButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.cyan,
      child: Text(name),
    );
  }
}
