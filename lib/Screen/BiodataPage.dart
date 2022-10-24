import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fortuna/Controller/BankApi.dart';
import 'package:fortuna/model/mBank.dart';
import 'package:fortuna/model/mUser.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/widget/DialogBank.dart';
import 'package:fortuna/widget/RowItem.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Style/StyleForm.dart';
import '../Style/StyleLoading.dart';
import '../widget/HeaderWidget.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  MUser mUser = Get.arguments;

  TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();

  late MBank mBankuser;
  late Future<MBank> futureData;
  final formatter =
      NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaController.text = mUser.nama.toString();
    emailController.text = mUser.email.toString();
    hpController.text = mUser.nomor.toString();
    futureData = ApiBank().getbankuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: headerWidget(),
        body: FutureBuilder<MBank>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                MBank? bank = snapshot.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Card(
                          color: kMerah,
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                if (bank?.id == null)
                                  DialogTambahBank(context: context);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (bank?.id == null)
                                      const Icon(
                                        Icons.add_circle_outline_sharp,
                                        size: 36,
                                        color: Colors.white,
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    if (bank?.id == null)
                                      const Text(
                                        "Tambah Bank",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    if (bank?.id != null)
                                      RowItem(
                                          title: "BANK",
                                          value: bank?.namaRekening ?? "-",
                                          fontWeight: FontWeight.bold,
                                          colors: Colors.white,
                                          font: 18),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RowItem(
                                        title: "NO REKENING",
                                        value: bank?.nomorRekening ?? "-",
                                        fontWeight: FontWeight.bold,
                                        colors: Colors.white,
                                        font: 18),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RowItem(
                                        title: "NAMA",
                                        value: bank?.atasnama ?? "-",
                                        fontWeight: FontWeight.bold,
                                        colors: Colors.white,
                                        font: 18),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "*Bank hanya dapat di tambahkan sekali jika ingini mengubahnya silahkan menghubungi admin",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Biodata",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FormBuilderTextField(
                                  name: 'Nama',
                                  controller: namaController,
                                  readOnly: true,
                                  enabled: false,
                                  decoration: StyleForm.borderInputStyle(
                                          title: "nama",
                                          prefix: const Icon(
                                            Icons.person,
                                          ))
                                      .copyWith(
                                          disabledBorder:
                                              StyleForm.borderMerahForm),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FormBuilderTextField(
                                  name: 'email',
                                  controller: emailController,
                                  readOnly: true,
                                  enabled: false,
                                  decoration: StyleForm.borderInputStyle(
                                          title: "Email",
                                          prefix: const Icon(
                                            Icons.email_rounded,
                                          ))
                                      .copyWith(
                                          disabledBorder:
                                              StyleForm.borderMerahForm),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FormBuilderTextField(
                                  name: 'telp',
                                  controller: hpController,
                                  readOnly: true,
                                  enabled: false,
                                  decoration: StyleForm.borderInputStyle(
                                          title: "No Telpon",
                                          prefix: const Icon(
                                            Icons.phone,
                                          ))
                                      .copyWith(
                                          disabledBorder:
                                              StyleForm.borderMerahForm),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Kode Referal : ${mUser.kodeReferal}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: mUser.kodeReferal));
                                            // copied successfully
                                          },
                                          child: const Icon(
                                            Icons.copy,
                                            color: Colors.grey,
                                            size: 18,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return StyleLoadingWidget(context);
              }
            }));
  }
}
