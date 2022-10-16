
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../Style/StyleButton.dart';
import '../Style/StyleForm.dart';
import '../Style/StyleLoading.dart';
import '../Style/StyleTop.dart';
import '../ui/app_assets.dart';
import '../ui/app_colors.dart';
import '../ui/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController referalController = TextEditingController();

  bool is_loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // extendBodyBehindAppBar: false,
        body: is_loading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : SizedBox(
          height: Get.height,
          child: Stack(
            children: [
              //Bg
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: const AssetImage(Gambar.background1),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          kMerah.withOpacity(0.1),
                          BlendMode.dstIn,
                        ))),
              ),
              ClipPath(
                clipper: Header3(),
                child: Container(
                  color: Colors.red,
                ),
              ),
              ClipPath(
                clipper: Header2(),
                child: Container(
                  color: kMerah,
                ),
              ),


              SizedBox(
                height: Get.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Image.asset(
                          Gambar.logo,
                          color: Colors.white,
                          fit: BoxFit.fitHeight,
                          height: 85,
                        ),
                      ),
                      SizedBox(height: 15,),
                      _registerForm()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _registerForm() {
    return Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FormBuilder(
                  key: _formKey,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Selamat Datang,\nDaftar untuk mengakses aplikasi',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kMerah,
                            letterSpacing: 0.5),
                      ),
                      const Divider(),
                      const SizedBox(height: 5),
                      FormBuilderTextField(
                        name: 'Nama',
                        decoration: StyleForm.borderInputStyle(
                            title: "nama",
                            prefix: const Icon(
                              Icons.email_rounded,
                            )),
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
                        decoration: StyleForm.borderInputStyle(
                            title: "Email",
                            prefix: const Icon(
                              Icons.email_rounded,
                            )),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'telp',
                        decoration: StyleForm.borderInputStyle(
                            title: "No Telpon",
                            prefix: const Icon(
                              Icons.phone,
                            )),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'pass',
                        decoration: StyleForm.borderInputStyle(
                            title: "Password",
                            prefix: const Icon(
                              Icons.password,
                            )),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'referal',
                        decoration: StyleForm.borderInputStyle(
                            title: "Kode Referal",
                            hint: "232324",
                            prefix: const Icon(
                              Icons.numbers_sharp,
                            )),

                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: StyleButton(
                              context: context,
                              navigator: () {
                                StyleLoadingDialog(context);
                                if (_formKey.currentState!.validate()) {
                                  print("object");
                                } else {
                                  Get.back();
                                }
                              },
                              title: "Daftar")),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Sudah memiliki akun.? '),
                        TextSpan(
                          text: 'Masuk Disini',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.masuk),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
