import 'package:flutter/material.dart';
import 'package:fortuna/Controller/PendapatanApi.dart';
import 'package:fortuna/Controller/ProductApi.dart';
import 'package:fortuna/Controller/UsersApi.dart';
import 'package:fortuna/List/ListProdukAktif.dart';
import 'package:fortuna/Screen/ProdukAktifPage.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/model/mProdukAktif.dart';
import 'package:fortuna/model/mUser.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:fortuna/widget/HeaderWidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../Controller/ProdukAktif.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  late Future<List<MProdukAktif>> futureListProduk;
  late Future<MUser> futureUser;
  late Future<String> futureTotal;

  late MUser mUser;
  int total = 0;
  List<MProdukAktif> listProduk = [];

  Future<MUser> getUser() async {
    final data = await ApiUser().userDetail();

    setState(() {
      mUser = data;
    });
    return data;
  }

  Future<List<MProdukAktif>> getProduk() async {
    final list = await ApiProdukAktif().getProdukAktif();
    setState(() {
      listProduk = list;
    });
    return list;
  }

  Future<String> getTotal() async {
    final dataTotal = await ApiPendapatan().getKeuntungan();
    setState(() {
      total = int.parse(dataTotal.toString());
    });
    return total.toString();
  }

  @override
  void initState() {
    super.initState();
    futureUser = getUser();
    futureListProduk = getProduk();
    futureTotal = getTotal();
  }

  @override
  Widget build(BuildContext context) {
    final format =
        NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);

    return Scaffold(
        appBar: headerWidget(),
        body: FutureBuilder(
            future: Future.wait([
              futureUser,
              futureListProduk,
              futureTotal,
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
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
                            children: [
                              const Text(
                                "Hello",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                mUser.nama.toString().toUpperCase() ?? "-",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),

                              const Divider(
                                height: 20,
                                color: Colors.white,
                              ),
                              const Text(
                                "Penghasilan Hari Ini",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              //Nominal
                               Text(
                                format.format(total),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),

                              const SizedBox(
                                height: 5,
                              ),
                              Text.rich(TextSpan(children: [
                                const TextSpan(
                                    text: "Dari ",
                                    style: TextStyle(color: Colors.white)),
                                //Paket aktif
                                TextSpan(
                                  text: listProduk.length.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const TextSpan(
                                    text: " Paket Investasi",
                                    style: TextStyle(color: Colors.white)),
                              ]))
                            ],
                          ),
                        ),
                      ),
                    ),

                    //5 list investasi terbaru
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Produk Aktif",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.produkSaya,
                                      arguments: listProduk);
                                },
                                child: const Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                      color: kMerah,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: (listProduk.length >= 3)
                                ? 3
                                : listProduk.length,
                            itemBuilder: (context, index) {
                              return ListProdukAktif(model: listProduk[index]);
                            }),
                      ),
                    )
                  ],
                );
              } else {
                return StyleLoadingWidget(context);
              }
            }));
  }
}
