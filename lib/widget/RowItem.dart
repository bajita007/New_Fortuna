import 'package:flutter/material.dart';

Row RowItem(
    {required String title,
    required String value,
    double font = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color colors = Colors.black}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: font, fontWeight: fontWeight, color: colors),
        textAlign: TextAlign.start,
      ),
      Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(fontSize: font, fontWeight: fontWeight, color: colors),
            textAlign: TextAlign.end,
          ))
    ],
  );
}
