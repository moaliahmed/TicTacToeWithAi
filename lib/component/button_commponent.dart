import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ButtonCommponent extends StatelessWidget {
  const ButtonCommponent(
      {super.key,
      required this.text,
      required this.onTap,
      this.colorText = Colors.black,
      this.buttonColor=Colors.white});
  final String text;
  final Function() onTap;
  final Color colorText;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: buttonColor,
            boxShadow:const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                offset: Offset(4, 8),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            text,
            style:  TextStyle(fontSize: 28,color: colorText  ), 
          ),
        ),
      ),
    );
  }
}
