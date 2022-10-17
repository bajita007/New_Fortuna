import 'package:flutter/material.dart';

Row RowItem({required String title, required String value, double font = 12}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: font, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
      Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(fontSize: font, fontWeight: FontWeight.w500),
            textAlign: TextAlign.end,
          ))
    ],
  );
}
