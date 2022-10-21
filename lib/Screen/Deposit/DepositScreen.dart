import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:get/get.dart';

import '../../Style/StyleButton.dart';
import '../../Style/StyleForm.dart';
import '../../ui/app_assets.dart';
import '../../ui/app_colors.dart';
import 'package:http/http.dart' show Client;

import 'ApiDeposit.dart';


class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {



  final _formKey = GlobalKey<FormState>();
  int nominal = 0;
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
                              FormBuilderValidators.min(50000,
                                  errorText: "Saldo Minimal Rp. 50.000"),
                            ]),
                            onChanged: (a){
                              setState(() {
                                nominal = int.parse(a);
                              });
                            },
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
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
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
                          children:  [
                            const Text(
                              "Jumlah Dana",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kMerah),
                            ),
                            Text(
                              "IDR $nominal",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                            ),


                          ],
                        ),
                      ),
                      Expanded(
                          child: StyleButton(
                              context: context,
                              navigator: () {
                              prosesToken();
                              },
                              title: "Tambah Dana")),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  prosesToken() async {
    final getToken = await ApiDeposit().getToken(
        hp: "0891212",
        id_user: "1",
        nominal: nominal.toString(),
        nama: "Awal").then((value){
          print(value.toString());
          if(value.isEmpty){

          }else{
            Get.toNamed(AppRoutes.webPay, arguments: value);

          }
    });
  }
}
