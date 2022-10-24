import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/model/mProduct.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/NotifWidget.dart';

class ApiProduct {
  Future<List<MProduct>> getDataProduk() async {
    final response =
        await http.get(Uri.parse('${Api.baseUrl}apigettipeinvest'));


    List<MProduct>? data = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      data = mProductFromJson(json['data']);

      return data;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  getDataCalculator({required String durasi, required String persentase}) {
    String hari = " Hari";
    if (durasi == "1") {
      hari = "Hari";
    } else {
      hari = durasi + " Hari";
    }
    String persen = persentase + "% / " + hari;
    return persen;
  }

  produkBeli(
      {required BuildContext context,
      required MProduct mProduct,
      required int quantiti}) async {
    StyleLoadingDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int id_user = sharedPreferences.getInt("id") ?? 0;
    String beli = '${Api.baseUrl}apiinvestasi';

    List<String> listQd = [];
    Map data = {
      'id': id_user.toString(),
      'tipe': mProduct.id.toString(),
    };
    for (var i = 1; i <= quantiti; i++) {
      http.Response response = await http.post(Uri.parse(beli), body: data);
      if (i == quantiti) {
        _setData(response, context);
      }
    }
  }

  void _setData(http.Response response, BuildContext context) {
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['success'] == true) {
        if (Navigator.canPop(context)) {
          Get.back();
        }
        notif(context, json['message'], '');
 

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
      notif(context, 'Gagal ', "Gagal");
    }
  }
}
