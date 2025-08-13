import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomItem({required String text, required IconData icon}) {
  return BottomNavigationBarItem(

    icon: Icon(icon,weight: 16,),
    label: text,
  );
}