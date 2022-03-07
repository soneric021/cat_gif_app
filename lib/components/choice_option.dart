import 'package:flutter/material.dart';

class ChoiceOption extends StatelessWidget {
  final String text;
  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.grey),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}
