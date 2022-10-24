import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/widget/NotifWidget.dart';
import 'package:fortuna/widget/RowItem.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/BankApi.dart';
import '../../Controller/SaldoApi.dart';
import '../../Style/StyleButton.dart';
import '../../Style/StyleForm.dart';
import '../../model/mBank.dart';
import '../../model/mUser.dart';
import '../../ui/app_assets.dart';
import '../../ui/app_colors.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  MUser mUser = Get.arguments;

  final _formKey = GlobalKey<FormState>();
  final formatter =
      NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);
  int nominal = 0;
  late MBank mBankuser;
  late Future<MBank> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = ApiBank().getbankuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MBank>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              MBank? mBank = snapshot.data;
              return Stack(
                children: [
                  SingleChildScrollView(
                      child: Column(children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(
                          top: 60, left: 20, right: 20, bottom: 20),
                      color: kMerah,
                      child: Image.asset(
                        Gambar.logo,
                        color: Colors.white,
                        height: 120,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(15),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Tarik Dana',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: kMerah,
                                  ),
                                ),
                                RowItem(
                                    title: "Saldo Utama",
                                    value: formatter.format(int.parse(
                                        mUser.saldoActive.toString())),
                                    font: 18,
                                    fontWeight: FontWeight.w800),
                                const Divider(),
                                TextFormField(
                                    // controller: _emailController,
                                    textInputAction: TextInputAction.go,
                                    initialValue: "0",
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.min(50000,
                                          errorText:
                                              "Saldo Minimal Penarikan Rp. 50.000"),
                                    ]),
                                    onChanged: (a) {
                                      setState(() {
                                        nominal = int.parse(a);
                                      });
                                    },
                                    decoration: StyleForm.borderInputStyle(
                                      title: "Nominal Withdraw",
                                      hint: "Masukkan Nominal Saldo",
                                      prefix: const Icon(
                                        Icons.money,
                                      ), //
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                    // controller: _emailController,
                                    textInputAction: TextInputAction.go,
                                    initialValue: mBank?.namaRekening ?? "-",
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText:
                                              "Masukkan Tipe Rekening/Bank"),
                                    ]),
                                    decoration: StyleForm.borderInputStyle(
                                      title: "Bank",
                                      hint: "Masukkan Nama Bank",
                                      prefix: const Icon(
                                        Icons.money,
                                      ), //
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                    // controller: _emailController,
                                    textInputAction: TextInputAction.go,
                                    initialValue: mBank?.nomorRekening ?? "-",
                                    enabled: false,
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: "Masukkan Nomor Rekening"),
                                    ]),
                                    decoration: StyleForm.borderInputStyle(
                                      title: "Nomor Rekening",
                                      hint: "Masukkan Nomor Rekening",
                                      prefix: const Icon(
                                        Icons.money,
                                      ), //
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                    // controller: _emailController,
                                    textInputAction: TextInputAction.go,
                                    initialValue: mBank?.atasnama ?? "-",
                                    enabled: false,
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText:
                                              "Masukkan Nama Pemilik Rekening"),
                                    ]),
                                    decoration: StyleForm.borderInputStyle(
                                      title: "Nama Pemilik Rekening",
                                      hint: "Masukkan Nama Pemilik Rekening",
                                      prefix: const Icon(
                                        Icons.money,
                                      ), //
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                if (mBank?.nomorRekening == null ||
                                    mBank?.id == "")
                                  const Text(
                                    "Silahkan isi bank terlebih dahulu di menu profil.",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic,
                                        color: kMerah),
                                  )
                              ]),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            RowItem(
                              title: "Biaya Admin",
                              value: "10%",
                              font: 16,
                            ),
                            RowItem(
                                title: "Biaya Bank",
                                value: "Rp6.500",
                                font: 16),
                            RowItem(
                                title: "Total Biaya Penanganan",
                                value: formatter.format((nominal * .10 + 6500)),
                                font: 16),
                            RowItem(
                                title: "Total Diterima",
                                value: formatter
                                    .format((nominal - (nominal * .10 + 6500))),
                                font: 16,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                  ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 40),
                    child: FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: kMerah,
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Jumlah",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: kMerah),
                                    ),
                                    Text(
                                      "IDR $nominal",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Divider(),
                                    const Text(
                                      "Diterima",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: kMerah),
                                    ),
                                    Text(
                                      "IDR ${nominal - (nominal * .10 + 6500)}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: StyleButton(
                                      context: context,
                                      navigator: () {
                                        if(mBank!.id == ""){
                                          notif(context, "Gagal", "Silihakan Isi Data Bank");
                                        }else{
                                          ApiSaldo().tarikSaldo(
                                              context: context,
                                              jumlah: nominal.toString(),
                                              idRek: mBank!.id.toString());
                                        }


                                        // ApiSaldo().tambahSaldo(context: context, jumlah: nominal.toString());
                                      },
                                      title: "Tarik Dana")),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return StyleLoadingWidget(context);
            }
          }),
    );
  }
}
