class mriwayat {
  final int id;
  final String nominal;
  final String bank;
  final String norek;
  final String jenis;
  final String status;
  final String biayaadmin;
  final String total;

  mriwayat({
    required this.id,
    required this.nominal,
    required this.bank,
    required this.status,
    required this.jenis,
    required this.norek,
    required this.biayaadmin,
    required this.total,
  });
}

List<mriwayat> dataRiwayat = [
  mriwayat(
      id: 1,
      nominal: "1200000",
      bank: "BNI",
      status: "Sukses",
      jenis: "Deposit",
      norek: "-",
      biayaadmin: "0",
      total: "1200000"),
  mriwayat(
      id: 2,
      nominal: "80000",
      bank: "-",
      status: "-",
      jenis: "Pembelian Paket 2",
      norek: "-",
      biayaadmin: "0",
      total: "80000"),
  mriwayat(
      id: 3,
      nominal: "90000",
      bank: "BCA",
      status: "Menunggu",
      jenis: "Deposit",
      norek: "-",
      biayaadmin: "0",
      total: "90000"),
  mriwayat(
      id: 4,
      nominal: "80000",
      bank: "BRI",
      status: "Gagal",
      jenis: "Withdraw",
      norek: "-",
      biayaadmin: "0",
      total: "80000"),
  mriwayat(
      id: 5,
      nominal: "1200000",
      bank: "BNI",
      status: "Sukses",
      jenis: "Deposit",
      norek: "1234567890",
      biayaadmin: "6500",
      total: "1206500"),

];
