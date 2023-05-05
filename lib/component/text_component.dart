import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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