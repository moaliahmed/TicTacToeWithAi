import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IconCommponent extends StatelessWidget {
  const IconCommponent({super.key, required this.image, required this.color});
final AssetImage image;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
  color: color,
  child: Image(image: image),
    );
  }
}