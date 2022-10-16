import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fortuna/Screen/RegisterScreeen.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/Style/StyleTop.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:get/get.dart';
import '../Style/StyleForm.dart';
import '../ui/app_assets.dart';
import '../ui/app_colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool is_loading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: false,
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
                            const SizedBox(
                              height: 15,
                            ),
                            _loginForm()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  _loginForm() {
    return Card(
        margin: EdgeInsets.all( 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Selamat Datang,\nSilahkan Login terlebih Dahulu',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kMerah,
                            letterSpacing: 1),
                      ),
                      const Divider(),
                      TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.name,
                        decoration: StyleForm.borderInputStyle(
                          title: "Email",
                          prefix: const Icon(
                            Icons.mail,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap Memasukkan Email Dengan Benar';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: StyleForm.borderInputStyle(
                            title: "Password",
                            prefix: const Icon(
                              Icons.password,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap Memasukkan Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: StyleButton(
                              context: context,
                              navigator: () {
                                StyleLoadingDialog(context);
                                if (_formKey.currentState!.validate()) {
                                  Get.removeRoute();
                                } else {
                                 Get.back();                             }
                              },
                              title: "Masuk")),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Anda belum memiliki akun.? '),
                        TextSpan(
                          text: 'Daftar Disini',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.daftar),
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
