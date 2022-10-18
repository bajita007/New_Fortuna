import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../Style/StyleForm.dart';
import '../../ui/app_assets.dart';
import '../../ui/app_colors.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
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
                          'Tambah Dana',
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

                              FormBuilderValidators.min(50000, errorText: "Saldo Minimal Rp. 50.000"),
                            ]),
                            decoration: StyleForm.borderInputStyle(
                              title: "Saldo",
                              hint: "Masukkan Nominal Saldo",
                              prefix: const Icon(
                                Icons.money,
                              ), //

                            )),
                      ]),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),

                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Pilih Bank',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kMerah,
                          ),
                        ),
                        const Divider(),

                      ]),
                ),
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
