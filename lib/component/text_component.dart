import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({super.key, required this.text});
 final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: 32),
    );
  }
}