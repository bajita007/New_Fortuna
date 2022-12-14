import 'package:flutter/material.dart';
import 'package:fortuna/Controller/ProductApi.dart';
import 'package:fortuna/model/mProduct.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:fortuna/widget/RowItem.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListInvestasi extends StatelessWidget {
  MProduct mInvestasi;
  ListInvestasi({Key? key, required this.mInvestasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.produk, arguments: mInvestasi);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: SizedBox(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: const Color.fromRGBO(45, 45, 45, 1),
                  child:
                      (mInvestasi.biayawd!.isEmpty || mInvestasi.biayawd == "")
                          ? Image.asset(
                              Gambar.logo,
                              fit: BoxFit.contain,
                              width: 125,
                              height: 125,
                            )
                          : Image.network(
                              'https://fortuna-inv.id/img/tipe/${mInvestasi.biayawd}',
                              fit: BoxFit.cover,
                              width: 125,
                              height: 125,
                            )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${mInvestasi.paket}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    //Durasi Paket
                    RowItem(
                        title: "Harga",
                        value: formatter
                            .format(int.parse(mInvestasi.investasi.toString())),
                        fontWeight: FontWeight.bold),

                    RowItem(
                        title: "Siklus",
                        value: "${mInvestasi.lamapenarikan} Hari"),
                    RowItem(
                        title: "Pendapatan Harian",
                        value: formatter.format(
                            int.parse(mInvestasi.bungaperhari.toString()))),
                    RowItem(
                        title: "Persentase ",
                        value: ApiProduct().getDataCalculator(
                            durasi: mInvestasi.lamapenarikanbunga.toString(),
                            persentase: mInvestasi.persenanhari.toString()))
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
