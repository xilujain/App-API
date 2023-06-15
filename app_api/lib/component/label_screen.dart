import 'package:flutter/material.dart';

class LabelScreen extends StatelessWidget {
  const LabelScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      )),
    );
  }
}
