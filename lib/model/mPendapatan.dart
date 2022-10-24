// To parse this JSON data, do
//
//     final mPendapatan = mPendapatanFromJson(jsonString);

import 'dart:convert';

List<MPendapatan> mPendapatanFromJson(List str) =>
    List<MPendapatan>.from(str.map((x)  => MPendapatan.fromJson(x)));

//
// List<MProdukAktif> mProdukAktifFromJson(List str) =>
//     List<MProdukAktif>.from(str.map((x)  => MProdukAktif.fromJson(x)));



class MPendapatan {
  MPendapatan({
    this.id,
    this.idUser,
    this.idPengajuan,
    this.idRealisasi,
    this.harike,
    this.jumlah,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? idUser;
  String? idPengajuan;
  String? idRealisasi;
  String? harike;
  String? jumlah;
  String? createdAt;
  String? updatedAt;

  factory MPendapatan.fromJson(Map json) => MPendapatan(
    id: json["id"]??"",
    idUser: json["id_user"]??"",
    idPengajuan: json["id_pengajuan"]??"",
    idRealisasi: json["id_realisasi"]??"",
    harike: json["harike"]??"",
    jumlah: json["jumlah"]??"",
    createdAt:json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "id_user": idUser,
  //   "id_pengajuan": idPengajuan,
  //   "id_realisasi": idRealisasi,
  //   "harike": harike,
  //   "jumlah": jumlah,
  //   "created_at": createdAt.toIso8601String(),
  //   "updated_at": updatedAt.toIso8601String(),
  // };
}
