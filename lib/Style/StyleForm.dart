import 'package:flutter/material.dart';


class StyleForm {
  static InputDecoration borderInputStyle(
      {required String title, required var prefix}) {
    // Widget prefix = prefix ?? Icon(Icons.import_contacts_sharp);

    // Widget dataPrefix =

    return InputDecoration(
        labelText: title,
        filled: true,

        enabledBorder: borderPutihForm,
        errorBorder: borderMerahForm,

        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        prefixIcon: prefix,
        errorStyle: const TextStyle(
          color: Colors.red,
        ));
  }



  static const borderPutihForm = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ));

  static const borderMerahForm = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ));
}
