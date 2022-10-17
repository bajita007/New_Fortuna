import 'package:flutter/material.dart';

InkWell ButtonHeaderProfile({required String title, required IconData icons, required Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Card(child: Icon(icons)),
        Text(title),
      ],
    ),
  );
}