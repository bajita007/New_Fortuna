import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fortuna/Controller/BankApi.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/ui/app_colors.dart';

import '../Style/StyleForm.dart';

void DialogTambahBank(
    {required BuildContext context, String title = "Tambah Bank"}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        final GlobalKey<FormBuilderState> _formKeyBank =
            GlobalKey<FormBuilderState>();
        final TextEditingController _namaBank = TextEditingController();
        final TextEditingController _tipeBank = TextEditingController();
        final TextEditingController _norekBank = TextEditingController();

        return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    const Divider(
                      color: kMerah,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            FormBuilder(
                              key: _formKeyBank,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(height: 10),
                                  FormBuilderTextField(
                                    name: 'Nama Pemilik Rekening',
                                    controller: _namaBank,
                                    decoration: StyleForm.borderInputStyle(
                                        title: "Nama",
                                        prefix: const Icon(
                                          Icons.person,
                                        )),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(height: 10),
                                  FormBuilderTextField(
                                    name: 'No Rek',
                                    controller: _norekBank,
                                    decoration: StyleForm.borderInputStyle(
                                        title: "No Rekening",
                                        prefix: const Icon(
                                          Icons.numbers,
                                        )),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                    ]),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(height: 10),
                                  FormBuilderTextField(
                                    name: 'Tipe Rekening',
                                    controller: _tipeBank,
                                    decoration: StyleForm.borderInputStyle(
                                        title: "Tipe Rekening",
                                        prefix: const Icon(
                                          Icons.food_bank,
                                        )),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: StyleButton(
                                            context: context,
                                            navigator: () {
                                              Navigator.pop(context);
                                            },
                                            title: "Batal",
                                            colors: Colors.red),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: StyleButton(
                                            context: context,
                                            navigator: () {
                                              _formKeyBank.currentState?.save();
                                              if (_formKeyBank.currentState
                                                      ?.validate() ==
                                                  true) {
                                                ApiBank().tambahBank(
                                                    context: context,
                                                    nomor_rekening:
                                                        _norekBank.text,
                                                    nama_rekening:
                                                        _tipeBank.text,
                                                    atasnama:
                                                        _namaBank.text.toString());
                                                // simpanData(sts, cnama, norek,
                                                //     ctipe, context, formKey);
                                              } else {
                                                Navigator.pop(context);
                                              }
                                            },
                                            title: "Simpan"),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                // Some text
                ));
      });
}

// void simpanData(
//     String sts,
//     TextEditingController cnama,
//     TextEditingController norek,
//     TextEditingController ctipe,
//     BuildContext context,
//     GlobalKey<FormBuilderState> formKey) {
//   Provider.of<ApiRekening>(context, listen: false)
//       .tambahRek(
//       modelRekening: ModelRekening(
//           tipeRek: ctipe.text.toString(),
//           noRek: norek.text.toString(),
//           namaRek: cnama.text.toString(),
//           statusRek: "Aktif")
//     // statusRek:
//     //     (sts.toString() == "false" || sts.toString() == "Aktif")
//     //         ? 'Tidak Aktif'
//     //         : 'Aktif')
//   )
//       .then((data) {
//     final scaffold = ScaffoldMessenger.of(context);
//     Navigator.of(context).pop();
//     if (data.id != null) {
//       scaffold.showSnackBar(
//         const SnackBar(
//           content: Text("Berhasil tambah bank..."),
//           duration: Duration(seconds: 3),
//         ),
//       );
//       if (Navigator.canPop(context)) {
//         Navigator.pop(context);
//       }
//     } else {
//       scaffold.showSnackBar(
//         const SnackBar(
//           content: Text("Gagal tambah Bank..."),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   });
// }
