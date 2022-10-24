import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortuna/model/mProdukAktif.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiProdukAktif{
  Future <List<MProdukAktif>> getProdukAktif() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id_user = sharedPreferences.getInt("id")?? 0;
    final response =
    await http.get( Uri.parse('${Api.baseUrl}apigetinvestasi/$id_user'));
    List<MProdukAktif>? data = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);


      data = mProdukAktifFromJson(json['data']);
      print(data.length.toString()+"TOTAL");

      return data;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}