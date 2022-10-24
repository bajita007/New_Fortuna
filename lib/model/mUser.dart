// To parse this JSON data, do
//
//     final mUser = mUserFromJson(jsonString);

import 'dart:convert';

MUser mUserFromJson(Map str) {

  return MUser.fromJson(str);
  // return str;
}

String mUserToJson(MUser data) => json.encode(data.toJson());

class MUser {
  MUser(
      {this.id,
      this.email,
      this.nama,
      this.nomor,
      this.username,
      this.role,
      this.isActive,
      this.status,
      this.kode,
      this.saldoActive,
      this.saldoTertahan,
      this.totalWd,
      this.bank,
      this.rekening,
      this.kodeReferal,
      this.password});

  int? id;
  String? email;
  String? nama;
  String? nomor;
  String? username;
  String? role;
  String? isActive;
  String? status;
  String? kode;
  //saldo_user
  String? saldoActive;
  String? saldoTertahan;
  String? totalWd;
  String? password;

  //ktps
  String? bank;
  String? rekening;
  String? kodeReferal;

  factory MUser.fromJson(Map json) => MUser(
        id: int.parse(json["id_user"] ??json["id"] ),
        email: json["email"]??"",
        nama: json["nama"]??"",
        nomor: json["nomor"]??"",
        username: json["username"]??"",
        role: json["role"]??"",
        isActive: json["is_active"]??"",
        status: json["status"]??"",
        kode: json["kode"]??"",
        saldoActive: json["saldo_active"]??"0",
        saldoTertahan: json["saldo_tertahan"]??"0",
        totalWd: json["total_wd"]??"",
        bank: json["bank"]??"",
        rekening: json["rekening"]??"",
        kodeReferal: json["kode_referal"]??"",
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "email": email ?? "",
        "nama": nama ?? "",
        "nomor": nomor ?? "",
        "username": username ?? "",
        "role": role ?? "",
        "is_active": isActive ?? "",
        "status": status ?? "",
        "kode": kode ?? "",
        "saldo_active": saldoActive ?? "",
        "saldo_tertahan": saldoTertahan ?? "",
        "total_wd": totalWd ?? "",
        "bank": bank ?? "",
        "rekening": rekening ?? "",
        "kode_referal": kodeReferal ?? "",
        "password": password ?? "",
      };
}
