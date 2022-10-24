import 'dart:convert';

import 'package:fortuna/model/mPendapatan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../ui/app_assets.dart';

class ApiPendapatan {
  Future<String> getKeuntungan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id_user = sharedPreferences.getInt("id") ?? 0;
    String api = '${Api.baseUrl}getpendapatan/$id_user';

    List<MPendapatan>? data = [];
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      data = mPendapatanFromJson(json['data']);
      int dataTotal = 0;
      for (int i = 0; i < data.length; i++) {
        MPendapatan pendapatan = data[i];
        dataTotal += int.parse(pendapatan.jumlah.toString());
      }

      return dataTotal.toString();
    } else {
      return "0";
    }
  }
}
