import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/mUser.dart';
import '../ui/app_assets.dart';
import '../ui/app_routes.dart';
import '../widget/NotifWidget.dart';

class ApiUser {
  void UserRegister(
      {required BuildContext context, required MUser mUser}) async {
    String registrasi_url = '${Api.baseUrl}apiregister';
    print(mUser.email.toString() + mUser.nama.toString() + 'registrasidua');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final response = await http.post(
      Uri.parse(registrasi_url),
      headers: headers,
      body: mUser.toJson(),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['success'] == true) {
        if (Navigator.canPop(context)) {
          Get.back();
        }
        saveToLocal(
            id: json['data']['id_user'],
            nama: mUser.nama.toString(),
            email: mUser.email.toString());
        Get.offAllNamed(AppRoutes.masuk);
        notif(context, 'Sukses', json['message']);
      } else {
        if (Navigator.canPop(context)) {
          Get.back();
        }
        notif(context, 'Gagal ', json['data']);
      }
    } else {
      if (Navigator.canPop(context)) {
        Get.back();
      }
      notif(context, 'Gagal ', "Gagal Daftar");
    }
  }

  void UserLogin({required BuildContext context, required MUser mUser}) async {
    String loginUrl = '${Api.baseUrl}apilogintesting';

    final response = await http.post(
      Uri.parse(loginUrl),
      // headers: {"Access-Control-Allow-Origin": "*"},

      body: mUser.toJson(),
    );
    print(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['success'] == true) {
        if (Navigator.canPop(context)) {
          Get.back();
        }
        saveToLocal(
            id: json['data']['id'],
            nama: json['data']['nama'],
            email: json['data']['email']);
        Get.offAllNamed(AppRoutes.home);

        notif(context, 'Sukses', json['message']);
      } else {
        if (Navigator.canPop(context)) {
          Get.back();
        }
        notif(context, 'Gagal ', json['data']);
      }
    } else {
      if (Navigator.canPop(context)) {
        Get.back();
      }
      notif(context, 'Gagal ', "Gagal Masuk");
    }
  }

  Future<MUser> userDetail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int iduser = sharedPreferences.getInt("id") ?? 0;
    String loginUrl = '${Api.baseUrl}apigetuser/${iduser}';
    print(iduser.toString());
    //get Data
    final msg = jsonEncode({'id': iduser});
    final responseGet = await http.post(
      Uri.parse("https://office.fortuna-inv.id/tes"),
      body: msg,
    );
    final response = await http.get(
      Uri.parse(loginUrl),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      MUser user = mUserFromJson(json['data']);
      return user;
    } else {
      Get.offAllNamed(AppRoutes.masuk);

      return MUser();
    }
  }

  Future<void> saveToLocal(
      {required int id, required String nama, required String email}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('id', id);
    await prefs.setString('nama', nama);
    await prefs.setString('email', email);
  }
}
