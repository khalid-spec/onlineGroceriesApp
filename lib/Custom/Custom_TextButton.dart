import 'package:flutter/material.dart';
import 'package:onlinegroceriesapp/Custom/CustomText.dart';

class CustomTextButtom extends StatelessWidget {
  final String text;
  final VoidCallback? onpressed;
  final Color? color;
  final double? size;
  final String? booold;
  const CustomTextButtom({super.key, required this.text, required this.color, this.size,required this.onpressed,  this.booold});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpressed, child:CustomText(text: text ,color: color,size: size,boold: FontWeight.bold,) );
  }
}
