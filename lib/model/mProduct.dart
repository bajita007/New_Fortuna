// To parse this JSON data, do
//
//     final mProduct = mProductFromJson(jsonString);

import 'dart:convert';

List<MProduct> mProductFromJson(List str) =>
    List<MProduct>.from(str.map((x) => MProduct.fromJson(x)));

String mProductToJson(List<MProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MProduct {
  MProduct({
    this.id,
    this.paket,
    this.investasi,
    this.persenanhari,
    this.lamapenarikanbunga,
    this.bungaperhari,
    this.total,
    this.lamapenarikan,
    this.periode,
    this.persenadmin,
    this.biayaadmin,
    this.biayawd,
    this.status,
    this.limit,

  });

  int? id;
  String? paket;
  String? investasi;
  String? persenanhari;
  String? lamapenarikanbunga;
  String? bungaperhari;
  String? total;
  String? lamapenarikan;
  String? periode;
  String? persenadmin;
  String? biayaadmin;
  String? biayawd;
  String? status;
  String? limit;


  factory MProduct.fromJson(Map<String, dynamic> json) => MProduct(
    id: json["id"]??"",
    paket: json["paket"]??"",
    investasi: json["investasi"]??"",
    persenanhari: json["persenanhari"]??"",
    lamapenarikanbunga: json["lamapenarikanbunga"]??"",
    bungaperhari: json["bungaperhari"]??"",
    total: json["total"]??"",
    lamapenarikan: json["lamapenarikan"]??"",
    periode: json["periode"]??"",
    persenadmin: json["persenadmin"]??"",
    biayaadmin:  json["biayaadmin"]??"",
    biayawd: json["biayawd"]??"",
    status: json["status"]??"",
    limit: json["limit"]??"",

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "paket": paket,
    "investasi": investasi,
    "persenanhari": persenanhari,
    "lamapenarikanbunga": lamapenarikanbunga,
    "bungaperhari": bungaperhari,
    "total": total,
    "lamapenarikan": lamapenarikan,
    "periode": periode,
    "persenadmin": persenadmin,
    "biayaadmin": biayaadmin,
    "biayawd": biayawd,
    "status": status,
    "limit": limit,

  };
}
