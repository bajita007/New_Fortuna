import 'package:flutter/material.dart';

ListTile ButtonProfile({required String title,
required IconData iconPath,
required BuildContext context,
Function()? onTap,}){



  return ListTile(
      onTap: onTap ?? (){},
      horizontalTitleGap: 5,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: Colors.white,
      leading: Icon(iconPath),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded)
  );
}