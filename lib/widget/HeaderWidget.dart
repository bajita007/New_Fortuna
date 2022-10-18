import 'package:flutter/material.dart';
import 'package:fortuna/ui/app_colors.dart';

import '../ui/app_assets.dart';

AppBar headerWidget() {
  return AppBar(
    backgroundColor: kMerah,
    centerTitle: false,
    title: Image.asset(Gambar.logo, height: 45,color: Colors.white,),
    elevation: 2.0,
  );
}