// To parse this JSON data, do
//
//     final mProdukAktif = mProdukAktifFromJson(jsonString);

import 'dart:convert';



List<MProdukAktif> mProdukAktifFromJson(List str) =>
    List<MProdukAktif>.from(str.map((x)  => MProdukAktif.fromJson(x)));



class MProdukAktif {
  MProdukAktif({
    this.id,
    this.idUser,
    this.nama,
    this.investasi,
    this.kode,
    this.buktitransfer,
    this.idPenerima,
    this.bungaharian,
    this.rupiahbungaharian,
    this.penarikanbunga,
    this.penarikaninvestasi,
    this.totalBonus,
    this.totalUntung,
    this.tipeInvestasi,
    this.biayawd,
    this.biayaadmin,
    this.statusPengajuan,
    this.statusInvestasi,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? idUser;
  String? nama;
  String? investasi;
  String? kode;
  String? buktitransfer;
  String? idPenerima;
  String? bungaharian;
  String? rupiahbungaharian;
  String? penarikanbunga;
  String? penarikaninvestasi;
  String? totalBonus;
  String? totalUntung;
  String? tipeInvestasi;
  String? biayawd;
  String? biayaadmin;
  String? statusPengajuan;
  String? statusInvestasi;
  String? createdAt;
  String? updatedAt;

  factory MProdukAktif.fromJson(Map json) => MProdukAktif(
        id: json["id"]??"",
        idUser: json["id_user"] ?? "",
        nama: json["nama"] ?? "",
        investasi: json["investasi"] ?? "",
        kode: json["kode"] ?? "",
        buktitransfer: json["buktitransfer"] ?? "",
        idPenerima: json["id_penerima"] ?? "",
        bungaharian: json["bungaharian"] ?? "",
        rupiahbungaharian: json["rupiahbungaharian"] ?? "",
        penarikanbunga: json["penarikanbunga"] ?? "",
        penarikaninvestasi: json["penarikaninvestasi"] ?? "",
        totalBonus: json["total_bonus"] ?? "",
        totalUntung: json["total_untung"] ?? "",
        tipeInvestasi: json["tipe_investasi"] ?? "",
        biayawd: json["biayawd"] ?? "",
        biayaadmin: json["biayaadmin"] ?? "",
        statusPengajuan: json["status_pengajuan"] ?? "",
        statusInvestasi: json["status_investasi"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["created_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "nama": nama,
        "investasi": investasi,
        "kode": kode,
        "buktitransfer": buktitransfer,
        "id_penerima": idPenerima,
        "bungaharian": bungaharian,
        "rupiahbungaharian": rupiahbungaharian,
        "penarikanbunga": penarikanbunga,
        "penarikaninvestasi": penarikaninvestasi,
        "total_bonus": totalBonus,
        "total_untung": totalUntung,
        "tipe_investasi": tipeInvestasi,
        "biayawd": biayawd,
        "biayaadmin": biayaadmin,
        "status_pengajuan": statusPengajuan,
        "status_investasi": statusInvestasi,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
