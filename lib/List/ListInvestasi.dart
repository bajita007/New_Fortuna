import 'package:flutter/material.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/widget/RowItem.dart';

import '../model/m_tipeinvest.dart';
import '../ui/app_assets.dart';

class ListInvestasi extends StatelessWidget {
  mtipeinvest mInvestasi;
  ListInvestasi({Key? key, required this.mInvestasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SizedBox(
        height: 125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Color.fromRGBO(45, 45, 45, 1),
                child: (mInvestasi.biayawd.isEmpty)
                    ? Image.asset(
                        Gambar.logo,
                        fit: BoxFit.contain,
                        width: 125,
                        height: 125,


                      )
                    : Image.network(
                        'https://investasiweb.minur.tech/img/tipe/${mInvestasi.biayawd}',
                        fit: BoxFit.contain,
                        width: 125,
                    height:125,

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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  //Durasi Paket
                  RowItem("Siklus", mInvestasi.lamapenarikan),
                  RowItem("Harga", mInvestasi.investasi),
                  RowItem("Pendapatan Harian", mInvestasi.total),
                  RowItem("Persentase ", mInvestasi.lamapenarikan)

                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
