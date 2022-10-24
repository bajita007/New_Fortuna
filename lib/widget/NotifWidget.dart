import 'package:flutter/material.dart';

notif(context,title,desc){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content:(desc =="")?Text(title): Text(title+' : '+desc)
    ),
  );
}