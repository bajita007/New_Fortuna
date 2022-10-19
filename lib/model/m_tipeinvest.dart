import 'dart:convert';

class mtipeinvest {
  final int id;
  final String paket;
  final String investasi;
  final String persenanhari;
  final String lamapenarikanbunga;
  final String bungaperhari;
  final String total;
  final String lamapenarikan;
  final String persenadmin;
  final String biayaadmin;
  final String biayawd;
  final String limited;
  final String totalLimit;

  mtipeinvest({
    required this.id,
    required this.paket,
    required this.investasi,
    required this.persenanhari,
    required this.lamapenarikanbunga,
    required this.bungaperhari,
    required this.total,
    required this.lamapenarikan,
    required this.persenadmin,
    required this.biayaadmin,
    required this.biayawd,
    required this.limited,
    required this.totalLimit,
  });

  factory mtipeinvest.fromJson(Map<String, dynamic> json) {
    return mtipeinvest(
      id: json['id'] ?? "",
      paket: json['paket'] ?? "",
      investasi: json['investasi'] ?? "",
      persenanhari: json['persenanhari'] ?? "",
      lamapenarikanbunga: json['lamapenarikanbunga'] ?? "",
      bungaperhari: json['bungaperhari'] ?? "",
      total: json['total'],
      lamapenarikan: json['lamapenarikan'] ?? "",
      persenadmin: json['persenadmin'] ?? "",
      biayaadmin: json['biayaadmin'] ?? "",
      biayawd: json['biayawd'] ?? "",
      limited: json['limited'] ?? "",
      totalLimit: json['totalLimit'] ?? "",
    );
  }
}

  List<mtipeinvest> dataInvest = [
   mtipeinvest(
      id: 0,
      paket: "Paket 1",
      investasi: "Rp.120.000",
      persenanhari: "10%",
      lamapenarikanbunga: "1 Hari",
      bungaperhari: "bungaperhari",
      total: "total",
      lamapenarikan: "lamapenarikan",
      persenadmin: "persenadmin",
      biayaadmin: "biayaadmin",
       limited: "true",
       totalLimit: "5",
      biayawd: ""),
   mtipeinvest(
       id: 1,
       paket: "Paket 2",
       investasi: "Rp.100.000",
       persenanhari: "15%",
       lamapenarikanbunga: "1 Hari",
       bungaperhari: "bungaperhari",
       total: "total",
       lamapenarikan: "lamapenarikan",
       persenadmin: "persenadmin",
       biayaadmin: "biayaadmin",
       limited: "true",
       totalLimit: "1",
       biayawd: ""),
   mtipeinvest(
       id: 2,
       paket: "Paket 3",
       investasi: "Rp.50.000",
       persenanhari: "10%",
       lamapenarikanbunga: "1 Hari",
       bungaperhari: "bungaperhari",
       total: "total",
       lamapenarikan: "lamapenarikan",
       persenadmin: "persenadmin",
       biayaadmin: "biayaadmin",
       limited: "true",
       totalLimit: "2",
       biayawd: ""),
    mtipeinvest(
        id: 3,
        paket: "Paket 5",
        investasi: "Rp.100.000",
        persenanhari: "15%",
        lamapenarikanbunga: "1 Hari",
        bungaperhari: "bungaperhari",
        total: "total",
        lamapenarikan: "lamapenarikan",
        persenadmin: "persenadmin",
        biayaadmin: "biayaadmin",
        limited: "true",
        totalLimit: "5",
        biayawd: ""),
    mtipeinvest(
        id: 4,
        paket: "Paket 4",
        investasi: "Rp.50.000",
        persenanhari: "10%",
        lamapenarikanbunga: "1 Hari",
        bungaperhari: "bungaperhari",
        total: "total",
        lamapenarikan: "lamapenarikan",
        persenadmin: "persenadmin",
        biayaadmin: "biayaadmin",
        limited: "true",
        totalLimit: "5",
        biayawd: ""),
];
