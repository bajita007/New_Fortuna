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
       biayawd: ""),
];
