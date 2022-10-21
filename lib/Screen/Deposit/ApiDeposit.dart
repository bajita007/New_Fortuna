import 'dart:convert';

import 'package:http/http.dart' show Client;

class ApiDeposit {
  final String baseUrl = "https://ayo-barter.com/payfor/snap/charge";
  Client client = Client();

  Future<String> getToken(
      {required String hp,
      required String id_user,
      required String nominal,
      required String nama}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final msg = jsonEncode({
      'id_user': id_user,
      'nominal': nominal,
      'nama': nama,
      'hp': hp,
    });

    var response = await client.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: msg,
    );
    var a = jsonDecode(response.body);
    print(a);
    var token = a['data']['token'];

    if (response.statusCode == 200 && token != null) {
      return token;
    } else {
      print("GAGALS");
      return "";
    }
  }
}
