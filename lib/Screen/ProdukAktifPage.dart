import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../List/ListProdukAktif.dart';
import '../model/mProdukAktif.dart';
import '../ui/app_colors.dart';

class ProdukAktifPage extends StatelessWidget {

  ProdukAktifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MProdukAktif> listProduk = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kMerah,
          title: const Text("Produk Saya"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listProduk.length,
              itemBuilder: (context, index) {
                return ListProdukAktif(model: listProduk[index]);
              }),
        ));
  }
}
