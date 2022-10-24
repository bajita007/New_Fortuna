import 'package:flutter/material.dart';
import 'package:fortuna/model/mProdukAktif.dart';
import 'package:intl/intl.dart';

import '../Controller/ProductApi.dart';
import '../ui/app_assets.dart';
import '../widget/RowItem.dart';

class ListProdukAktif extends StatelessWidget {
  MProdukAktif model;
  ListProdukAktif({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(model.biayawd.toString() + "GAMBAR");
    final formatter =
        NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);
    return InkWell(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SizedBox(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: const Color.fromRGBO(45, 45, 45, 1),
                  child: (model.biayawd!.isEmpty || model.biayawd == "")
                      ? Image.asset(
                          Gambar.logo,
                          fit: BoxFit.contain,
                          width: 125,
                          height: 125,
                        )
                      : Image.network(
                          'https://fortuna-inv.id/img/tipe/' +
                              model.biayawd.toString(),
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
                      '${model.nama}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    //Durasi Paket
                    RowItem(
                        title: "Harga",
                        value: formatter
                            .format(int.parse(model.investasi.toString())),
                        fontWeight: FontWeight.bold),

                    RowItem(
                        title: "Siklus", value: "${model.bungaharian} Hari"),
                    RowItem(
                        title: "Pendapatan Harian",
                        value: formatter.format(
                            int.parse(model.rupiahbungaharian.toString()))),
                    RowItem(
                        title: "Persentase ",
                        value: ApiProduct().getDataCalculator(
                            durasi: model.penarikanbunga.toString(),
                            persentase: model.bungaharian.toString()))
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
