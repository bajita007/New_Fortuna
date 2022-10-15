import 'package:flutter/material.dart';
import 'package:fortuna/List/ListInvestasi.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/widget/HeaderWidget.dart';
import 'package:get/get.dart';

import '../model/m_tipeinvest.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: Card(
              color: kMerah,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Nama Pengguna",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),

                    Divider(
                      height: 20,
                      color: Colors.white,
                    ),
                    Text(
                      "Penghasilan Harian",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    //Nominal
                    Text(
                      "Rp.1.000.000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Dari ", style: TextStyle(color: Colors.white)),
                      //Paket aktif
                      TextSpan(
                        text: "2",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      TextSpan(
                          text: " Paket Investasi",
                          style: TextStyle(color: Colors.white)),
                    ]))
                  ],
                ),
              ),
            ),
          ),

          //5 list investasi terbaru
          const Card(
            color: Colors.white,
            margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Produk Investasi Terbaru",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: (dataInvest.length >= 3) ? 3 : dataInvest.length,
                itemBuilder: (context, index) {
                  return ListInvestasi(mInvestasi: dataInvest[index]);
                }),
          )
        ],
      ),
    );
  }
}
