import 'package:flutter/material.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/widget/RowItem.dart';
import 'package:get/get.dart';

import '../model/m_tipeinvest.dart';
import '../ui/app_assets.dart';

class DetailsProduk extends StatefulWidget {
  const DetailsProduk({Key? key}) : super(key: key);
  @override
  State<DetailsProduk> createState() => _DetailsProdukState();
}

class _DetailsProdukState extends State<DetailsProduk> {
  final mtipeinvest modelInvest = Get.arguments;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMerah,
        title: const Text("Produk Investasi"),
      ),
      body: Stack(
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
                    child: (modelInvest.biayawd.isEmpty)
                        ? Padding(
                            padding: EdgeInsets.all(20),
                            child: Image.asset(
                              Gambar.logo,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Image.network(
                            'https://investasiweb.minur.tech/img/tipe/${modelInvest.biayawd}',
                            fit: BoxFit.contain,
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
                            title: "Penghasilan Harian",
                            value: "value",
                            font: 16),
                        const SizedBox(
                          height: 15,
                        ),
                        RowItem(
                            title: "Siklus Investasi",
                            value: "value",
                            font: 16),
                        const SizedBox(
                          height: 15,
                        ),
                        RowItem(title: "Harga", value: "value", font: 16),
                        const SizedBox(
                          height: 15,
                        ),
                        RowItem(
                            title: "Total Pendapatan",
                            value: "value",
                            font: 16),
                        const SizedBox(
                          height: 15,
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

  Flexible BottomBar() {
    return Flexible(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Text(
                  "Jumlah Pembelian",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
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
                    children: const [
                      Text(
                        "Pembayaran",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kMerah),
                      ),
                      Text(
                        "Rp.100.000",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: StyleButton(
                        context: context,
                        navigator: () {},
                        title: "Beli Sekarang")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
