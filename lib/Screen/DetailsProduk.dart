import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortuna/Controller/ProductApi.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/model/mProduct.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/widget/NotifWidget.dart';
import 'package:fortuna/widget/RowItem.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/UsersApi.dart';
import '../Style/StyleLoading.dart';
import '../model/mUser.dart';
import '../ui/app_assets.dart';
import '../ui/app_routes.dart';

class DetailsProduk extends StatefulWidget {
  const DetailsProduk({Key? key}) : super(key: key);
  @override
  State<DetailsProduk> createState() => _DetailsProdukState();
}

class _DetailsProdukState extends State<DetailsProduk> {
  MProduct model = Get.arguments;

  final formatter =
      NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);
  int totalQuantity = 1;

  MUser mUser = MUser();
  bool is_loading = true;

  @override
  void initState() {
    super.initState();
    check();
  }

  check() async {
    final data = await ApiUser().userDetail();
    if (data.id == 0 || data.id == "") {
      Get.offAllNamed(AppRoutes.masuk);
    }
    setState(() {
      is_loading = false;
      mUser = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMerah,
        title: const Text("Produk Investasi"),
      ),
      body: is_loading
          ? StyleLoadingWidget(context)
          : Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 130),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 220,
                          width: Get.width,
                          color: kMerah,
                          child: (model.biayawd!.isEmpty || model.biayawd == "")
                              ? Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Image.asset(
                                    Gambar.logo,
                                    color: Colors.white,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Image.network(
                                  'https://investasiweb.minur.tech/img/tipe/${model.biayawd}',
                                  fit: BoxFit.cover,
                                )),
                      Card(
                        margin: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Deskripsi Produk",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              Divider(),
                              RowItem(
                                  title: "Nama Produk",
                                  value: model.paket.toString(),
                                  font: 16),
                              const SizedBox(
                                height: 10,
                              ),
                              RowItem(
                                  title: "Penghasilan Harian",
                                  value: formatter.format(
                                      int.parse(model.bungaperhari.toString())),
                                  font: 16),
                              const SizedBox(
                                height: 10,
                              ),
                              RowItem(
                                  title: "Siklus Investasi",
                                  value: "${model.lamapenarikan} Hari",
                                  font: 16),
                              const SizedBox(
                                height: 10,
                              ),
                              RowItem(
                                  title: "Harga",
                                  value: formatter.format(
                                      int.parse(model.investasi.toString())),
                                  font: 16,
                                  fontWeight: FontWeight.bold),
                              const SizedBox(
                                height: 10,
                              ),
                              RowItem(
                                  title: "Total Pendapatan",
                                  value: formatter.format(
                                      int.parse(model.total.toString())),
                                  font: 16,
                                  fontWeight: FontWeight.bold),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: BottomBar(),
                ),
              ],
            ),
    );
  }

  Container BottomBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Jumlah Pembelian",
                  style: TextStyle(fontSize: 16),
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (totalQuantity > 1) {
                          setState(() {
                            totalQuantity--;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(color: kMerah, width: 3)),
                        primary: Colors.white,
                        padding: const EdgeInsets.only(bottom: 3),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kMerah),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    totalQuantity.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kMerah),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          totalQuantity++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(color: kMerah, width: 3)),
                        primary: Colors.white,
                        padding: const EdgeInsets.only(bottom: 3),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kMerah),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ]),
          const Divider(
            height: 30,
            thickness: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Pembayaran",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kMerah),
                    ),
                    Text(
                      "IDR ${totalPayment(totalQuantity, model.investasi.toString())}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: StyleButton(
                      context: context,
                      navigator: () {
                        if (int.parse(mUser.saldoActive.toString()) >=
                            totalPayment(totalQuantity ,
                                model.investasi.toString())) {
                          ApiProduct().produkBeli(
                              context: context,
                              mProduct: model,
                              quantiti: totalQuantity);
                        } else {
                          notif(context, "GAGAL", "Saldo Anda Tidak Mencukupi");
                        }
                      },
                      title: "Beli Sekarang")),
            ],
          )
        ],
      ),
    );
  }

  totalPayment(int quan, String harga) {
    var haragInt = int.parse(harga);
    int total = quan * haragInt;
    return total;
  }
}
