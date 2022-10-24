import 'package:flutter/material.dart';
import 'package:fortuna/Controller/ProductApi.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/model/mProduct.dart';
import 'package:intl/intl.dart';

import '../List/ListInvestasi.dart';
import '../widget/HeaderWidget.dart';

class InvestasiPage extends StatefulWidget {
  const InvestasiPage({Key? key}) : super(key: key);

  @override
  State<InvestasiPage> createState() => _InvestasiPageState();
}

class _InvestasiPageState extends State<InvestasiPage> {
  bool is_loading = true;

  late Future<List<MProduct>> futureData;

  @override
  initState() {
    super.initState();
    futureData = ApiProduct().getDataProduk();
    // setId();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: FutureBuilder<List<MProduct>>(
          future: futureData,
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              List<MProduct>? data = snapshot.data;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return ListInvestasi(mInvestasi: data![index]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return StyleLoadingWidget(context);
          },
        ),
      ),
    );
  }
}
