// To parse this JSON data, do
//
//     final mRiwayatSaldo = mRiwayatSaldoFromJson(jsonString);

import 'dart:convert';

List<MRiwayatSaldo> mRiwayatSaldoFromJson(List str) =>
    List<MRiwayatSaldo>.from(str.map((x) => MRiwayatSaldo.fromJson(x)));

// String mRiwayatSaldoToJson(List<MRiwayatSaldo> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MRiwayatSaldo {
  MRiwayatSaldo({
    this.id,
    this.idUser,
    this.jumlah,
    this.kode,
    this.buktitransfer,
    this.idPenerima,
    this.idRekening,
    this.statusMasuk,
    this.status,
    this.tanggalVerif,
    this.tanggalAjuDepo,
    this.jenis,
    this.buktiwd,
    this.tanggalWd,
    this.tanggalAjuWd,
    this.biayaadmin,
    this.total,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? idUser;
  String? jumlah;
  String? kode;
  String? buktitransfer;
  String? idPenerima;
  String? idRekening;
  String? statusMasuk;
  String? status;
  String? tanggalVerif;
  String? tanggalAjuDepo;
  String? jenis;
  String? buktiwd;
  String? tanggalWd;
  String? tanggalAjuWd;
  String? biayaadmin;
  String? total;
  String? createdAt;
  String? updatedAt;

  factory MRiwayatSaldo.fromJson(Map json) => MRiwayatSaldo(
        id: json["id"] ?? "0",
        idUser: json["id_user"] ?? "",
        jumlah: json["jumlah"] ?? "",
        kode: json["kode"] ?? "",
        buktitransfer: json["buktitransfer"] ?? "",
        idPenerima: json["id_penerima"] ?? "",
        idRekening: json["id_rekening"] ?? "",
        statusMasuk: json["status_masuk"] ?? "",
        status: json["status"] ?? "",
        tanggalVerif: json["tanggal_verif"] ?? "",
        tanggalAjuDepo: json["tanggal_aju_depo"] ?? "",
        jenis: json["jenis"] ?? "",
        buktiwd: json["buktiwd"] ?? "",
        tanggalWd: json["tanggal_wd"] ?? "",
        tanggalAjuWd: json["tanggal_aju_wd"] ?? "",
        biayaadmin: json["biayaadmin"] ?? "",
        total: json["total"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "id_user": idUser,
  //   "jumlah": jumlah,
  //   "kode": kode,
  //   "buktitransfer": buktitransfer,
  //   "id_penerima": idPenerima,
  //   "id_rekening": idRekening,
  //   "status_masuk": statusMasuk,
  //   "status": status,
  //   "tanggal_verif": tanggalVerif.toIso8601String(),
  //   "tanggal_aju_depo": tanggalAjuDepo.toIso8601String(),
  //   "jenis": jenis,
  //   "buktiwd": buktiwd,
  //   "tanggal_wd": tanggalWd,
  //   "tanggal_aju_wd": tanggalAjuWd,
  //   "biayaadmin": biayaadmin,
  //   "total": total,
  //   "created_at": createdAt.toIso8601String(),
  //   "updated_at": updatedAt.toIso8601String(),
  // };
}
