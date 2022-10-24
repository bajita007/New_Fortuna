import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fortuna/model/mBank.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:fortuna/ui/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/NotifWidget.dart';

class ApiBank {
  tambahBank(
      {required BuildContext context,
      required String nomor_rekening,
      required String nama_rekening,
      required String atasnama}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id_user = sharedPreferences.getInt("id") ?? 0;
    String baseUrl = Api.baseUrl + 'apipostbank';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      'id': id_user.toString(),
      'nomor_rekening': nomor_rekening,
      'nama_rekening': nama_rekening,
      'atasnama': atasnama,
    });

    var response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: msg,
    );
    var a = jsonDecode(response.body);
    print(a);
    if (Navigator.canPop(context)) {
      Get.back();
    }
    if (response.statusCode == 200) {
      notif(context, 'Sukses Menambahkan Rekening', '');
      Get.back();
    } else {
      notif(context, 'Gagal ', "Gagal menambahkan rekening");
    }
  }

  Future<MBank> getbankuser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id_user = sharedPreferences.getInt("id") ?? 0;
    final response =
        await http.get(Uri.parse('${Api.baseUrl}apigetbankuser/$id_user'));
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List jsonResponse = map['data'];

      List<MBank> allRek = mBankFromJson(jsonResponse);
      MBank mBank = MBank();
      if (allRek.isNotEmpty) {
        mBank = allRek[allRek.length-1];
      }



      return mBank;
    } else {
      return MBank();
    }
  }
}
