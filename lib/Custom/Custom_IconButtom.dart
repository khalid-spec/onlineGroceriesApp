import 'package:flutter/material.dart';

class CustomIconButom extends StatelessWidget {
  final  icons;
  final Color? color;
  final double? size;
  final VoidCallback onPressed;
  const CustomIconButom({super.key, required this.icons, this.color, this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed,
     icon: Icon(icons ),
     color: color,
     iconSize: size,
     );
  }
}