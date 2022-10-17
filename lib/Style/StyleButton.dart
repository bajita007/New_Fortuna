import 'package:flutter/material.dart';
import 'package:fortuna/ui/app_colors.dart';

ElevatedButton StyleButton(
    {required BuildContext context,
    required var navigator,
    required String title,
    Color colors = kMerah}) {
  return ElevatedButton(
    onPressed: navigator,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      primary: colors,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
      textStyle: TextStyle(fontSize: 14),
    ),
    child: Text(
      title,
    ),
  );
}

ElevatedButton StyleButtonIcons(
    {required BuildContext context,
      required var navigator,
      required String title,
      required IconData icons,
       Color iconsColor = kMerah,
      Color colors = Colors.white}) {
  return ElevatedButton(
    onPressed: navigator,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      primary: colors,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
      textStyle: TextStyle(fontSize: 14),
    ),
    child: Row(
      children: [
        Icon(icons, color: iconsColor,),
        const SizedBox(width: 10,),
        Text(
          title,
          style: TextStyle(color: iconsColor, letterSpacing: 1),
        ),
      ],
    ),
  );
}