import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../widget/NotifWidget.dart';

class ApiReedemKode {
  getDataPromo({required BuildContext context, required String code}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id_user = sharedPreferences.getInt("id") ?? 0;
    String api = '${Api.baseUrl}apipostredeemcode';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({'id': id_user, 'code': code});

    var response = await http.post(
      Uri.parse(api),
      headers: headers,
      body: msg,
    );
    var a = jsonDecode(response.body);
    print(a);
    var token = a['data'];

    if (response.statusCode == 200 && token != null) {
      if (a['message'] == "Gagal") {
        notif(context, a['message'], a['data']);
      } else {
        if (Navigator.canPop(context)) {
          Get.back();
        }
        notif(context, a['message'], a['data']);
      }
    } else {
      if (Navigator.canPop(context)) {
        Get.back();
      }
      notif(context, "Gagal", a['message']);
    }
  }
}
