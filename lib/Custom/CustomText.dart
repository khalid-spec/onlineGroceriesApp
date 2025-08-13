import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final  boold;
  
  const CustomText({super.key, required this.text, this.color, this.size,  this.boold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color==null? Colors.black :color,
        fontSize: size==null?18:size,
        fontWeight: boold,
      ),
    );
  }
}