import 'package:flutter/material.dart';
import 'package:fortuna/Controller/SaldoApi.dart';
import 'package:fortuna/List/ListRiwayatSaldo.dart';
import 'package:fortuna/model/MRiwayatSaldo.dart';
import 'package:fortuna/widget/HeaderWidget.dart';

import '../Style/StyleLoading.dart';


class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  bool _toggleButton = false;
  bool is_loading = true;

  late Future<List<MRiwayatSaldo>> futureData;

  @override
  initState() {
    super.initState();
    futureData = ApiSaldo().getDataRiwayat();
    // setId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: headerWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FutureBuilder<List<MRiwayatSaldo>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MRiwayatSaldo>? data = snapshot.data;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return ListRiwayatSaldo(model: data![index]);
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return StyleLoadingWidget(context);
            },
          ),

        ));
  }
}
