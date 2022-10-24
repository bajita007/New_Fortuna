import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/model/MRiwayatSaldo.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/widget/NotifWidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/app_routes.dart';

class ApiSaldo {
  Future<List<MRiwayatSaldo>> getDataRiwayat() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int iduser = sharedPreferences.getInt("id") ?? 0;
    final response =
        await http.get(Uri.parse('${Api.baseUrl}apigetriwayatdepo/${iduser}'));
    print("GET DATA");

    List<MRiwayatSaldo>? data = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      data = mRiwayatSaldoFromJson(json['data']);
      print(data[1].id);
      return data;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  void tambahSaldo(
      {required BuildContext context, required String jumlah}) async {

    // StyleLoadingDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int iduser = sharedPreferences.getInt("id") ?? 0;
    String nama = sharedPreferences.getString("nama") ?? '';


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      'id_user': iduser,
      'jumlah': jumlah,
      'nama': nama,

    });

    var response = await http.post(
      Uri.parse("${Api.baseUrl}papimidtrans"),
      headers: headers,
      body: msg,
    );
    var a = jsonDecode(response.body);
    print(a);
    var token = a['data'];

    if (response.statusCode == 200 && token != null) {

      Get.offNamed(AppRoutes.webPay, arguments: token);
    } else {

      notif(context, "Gagal", "Gagal Membuat Transit");
    }
  }

  void tarikSaldo({required String jumlah, required String idRek, required BuildContext context}) async {
    StyleLoadingDialog(context);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id_user = sharedPreferences.getInt("id")?? 0;
    String api = '${Api.baseUrl}apiwithdraw';
    print(id_user+id_user);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      'id_user' : id_user,
      'jumlah' : jumlah,
      'id_rekening' : idRek,

    });


    var response = await http.post(
      Uri.parse(api),
      headers: headers,
      body: msg,
    );
    var a = jsonDecode(response.body);
    print(a);
    var token = a['data'];

    if (response.statusCode == 200 && token != null) {
      if(Navigator.canPop(context)){
        Get.back();
      }
      notif(context, "Sukses", "Sukses Pengajuan Transaksi");

      Get.toNamed(AppRoutes.home);
    } else {
      if(Navigator.canPop(context)){
        Get.back();
      }
      notif(context, "Gagal", "Gagal Membuat Transaksi");
    }

  }
}
