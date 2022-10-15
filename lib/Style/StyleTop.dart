import 'package:flutter/material.dart';

class Header1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 120.0)
      ..quadraticBezierTo(
        size.width / 2.2,
        160.0,
        size.width,
        70.0,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Header2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 180.0)
      ..quadraticBezierTo(
        size.width / 2,
        150.0,
        size.width,
        90.0,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Header3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 190.0)
      ..quadraticBezierTo(
        size.width / 2,
        160.0,
        size.width,
        100.0,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}