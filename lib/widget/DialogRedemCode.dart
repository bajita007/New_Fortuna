import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fortuna/Controller/BankApi.dart';
import 'package:fortuna/Controller/KodePromoApi.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/ui/app_colors.dart';

import '../Style/StyleForm.dart';

void DialogReedemCode(
    {required BuildContext context, String title = "KODE PROMO"}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        final GlobalKey<FormBuilderState> _formKeyBank =
            GlobalKey<FormBuilderState>();
        final TextEditingController _kode = TextEditingController();

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
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    const Divider(
                      color: kMerah,
                    ),
                    const Text(
                        "Masukkan kode promo yang telah di berikan oleh para admin dari fortuna ataupun dari official member fortuna"),
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
                                    name: 'KODE',
                                    controller: _kode,
                                    decoration: StyleForm.borderInputStyle(
                                        title: "KODE PROMO",
                                        hint: "FORTUNA",
                                        prefix: const Icon(
                                          Icons.person,
                                        )),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText:
                                              "Kode Promo Tidak Boleh Kosong"),
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
                                                ApiReedemKode().getDataPromo(
                                                    context: context,
                                                    code: _kode.text);
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
