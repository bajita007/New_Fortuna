import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  int totalQuantity = 1;
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
                            title: "Nama Produk",
                            value: modelInvest.paket,
                            font: 16),
                        const SizedBox(
                          height: 10,
                        ),

                        RowItem(
                            title: "Penghasilan Harian",
                            value: "value",
                            font: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        RowItem(
                            title: "Siklus Investasi",
                            value: "value",
                            font: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        RowItem(title: "Harga", value: "value", font: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        RowItem(
                            title: "Total Pendapatan",
                            value: "value",
                            font: 16),
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
                        if(totalQuantity > 1 ){
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
                        print(modelInvest.totalLimit.toString());
                        if (totalQuantity !=
                            int.parse(modelInvest.totalLimit.toString())) {
                          setState(() {
                            totalQuantity++;
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
    );
  }
}
