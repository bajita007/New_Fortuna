// To parse this JSON data, do
//
//     final mBank = mBankFromJson(jsonString);

import 'dart:convert';



List<MBank> mBankFromJson(List str) =>
    List<MBank>.from(str.map((x) => MBank.fromJson(x)));

String mBankToJson(List<MBank> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// List<MBank> mBankFromJson(String str) => List<MBank>.from(json.decode(str).map((x) => MBank.fromJson(x)));
//
// String mBankToJson(List<MBank> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class MBank {
  MBank({
    this.id,
    this.idUser,
    this.nomorRekening,
    this.namaRekening,
    this.atasnama,

  });

  int? id;
  String? idUser;
  String? nomorRekening;
  String? namaRekening;
  String? atasnama;


  factory MBank.fromJson(Map<String, dynamic> json) => MBank(
    id: json["id"]??"",
    idUser: json["id_user"]??"",
    nomorRekening: json["nomor_rekening"]??"",
    namaRekening: json["nama_rekening"]??"",
    atasnama: json["atasnama"]??"",

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "nomor_rekening": nomorRekening,
    "nama_rekening": namaRekening,
    "atasnama": atasnama,

  };
}
