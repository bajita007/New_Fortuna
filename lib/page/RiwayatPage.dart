import 'package:flutter/material.dart';
import 'package:fortuna/List/ListRiwayatSaldo.dart';
import 'package:fortuna/widget/HeaderWidget.dart';

import '../model/m_riwayat.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerWidget(),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:  dataRiwayat.length,
                itemBuilder: (context, index) {
                  return ListRiwayatSaldo(riwayat: dataRiwayat[index]);
                }),
          )
        ],
      ),
    );
  }
}
