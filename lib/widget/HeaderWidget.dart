import 'package:flutter/material.dart';

import '../ui/app_assets.dart';

AppBar headerWidget() {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: false,
    title: Image.asset(Gambar.logo, height: 45,),
    elevation: 2.0,
  );
}