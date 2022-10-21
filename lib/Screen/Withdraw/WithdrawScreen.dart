import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fortuna/widget/RowItem.dart';
import 'package:get/get.dart';

import '../../Style/StyleButton.dart';
import '../../Style/StyleForm.dart';
import '../../ui/app_assets.dart';
import '../../ui/app_colors.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                            initialValue: "",
                            keyboardType: TextInputType.text,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: "Masukkan Tipe Rekening/Bank"),
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
                            initialValue: "0",
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
                            initialValue: "0",
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: "Masukkan Nama Pemilik Rekening"),
                            ]),
                            decoration: StyleForm.borderInputStyle(
                              title: "Nama Pemilik Rekening",
                              hint: "Masukkan Nama Pemilik Rekening",
                              prefix: const Icon(
                                Icons.money,
                              ), //
                            )),
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
                    RowItem(title: "Aktiva", value: "Rp.100.000", font: 16),
                    RowItem(
                        title: "Biaya Penanganan",
                        value: "Rp.100.000",
                        font: 16),
                    RowItem(title: "Tarif Biaya", value: "10%", font: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
          ])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
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

        ],
      ),
    );
  }
}
