import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:fortuna/widget/DialogRedemCode.dart';
import 'package:fortuna/widget/NotifWidget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/UsersApi.dart';
import '../Style/StyleLoading.dart';
import '../model/mUser.dart';
import '../widget/ButtonProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MUser mUser = MUser();
  bool is_loading = true;
  final formatter =
      NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);
  check() async {
    var data = await ApiUser().userDetail();
    if (data.id == 0 || data.id == "") {
      Get.offAllNamed(AppRoutes.masuk);
    }
    setState(() {
      is_loading = false;
      mUser = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: is_loading
          ? StyleLoadingWidget(context)
          : Column(
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(
                      top: 40, left: 20, right: 20, bottom: 20),
                  color: kMerah,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Gambar.logo,
                        color: Colors.white,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage(Gambar.icons_profile),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Saldo Utama",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  formatter.format(
                                      int.parse(mUser.saldoActive.toString())),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Saldo Tertahan ",
                                      style: TextStyle(color: Colors.white)),
                                  //Paket aktif
                                  TextSpan(
                                    text: formatter.format(int.parse(
                                        mUser.saldoTertahan.toString())),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ])),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: StyleButtonIcons(
                                  context: context,
                                  navigator: () {
                                    Get.toNamed(AppRoutes.topup);
                                  },
                                  title: "Tambah Dana",
                                  icons: Icons.account_balance_wallet)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: StyleButtonIcons(
                                  context: context,
                                  navigator: () {
                                    Get.toNamed(AppRoutes.withdraw,
                                        arguments: mUser);
                                  },
                                  title: "Tarik Dana",
                                  icons: Icons.upload_outlined)),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ButtonProfile(
                          context: context,
                          iconPath: Icons.account_circle,
                          title: "Profle",
                          onTap: () {
                            Get.toNamed(AppRoutes.biodata, arguments: mUser);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonProfile(
                          context: context,
                          iconPath: Icons.supervised_user_circle_outlined,
                          title: "Ajak Teman",
                          onTap: () {
                            openwhatsapp();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonProfile(
                          context: context,
                          iconPath: Icons.card_giftcard,
                          title: "Reedem Code",
                          onTap: () {
                            DialogReedemCode(context: context);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonProfile(
                          context: context,
                          iconPath: FontAwesomeIcons.whatsapp,
                          title: "Join Group Whatsapp",
                          onTap: () {
                            joinwa();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonProfile(
                          context: context,
                          iconPath: FontAwesomeIcons.telegram,
                          title: "Join Group Telegram",
                          onTap: () {
                            jointele();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonProfile(
                          context: context,
                          iconPath: FontAwesomeIcons.signOut,
                          title: "Keluar",
                          onTap: () {
                            removeValues();
                            Get.offAllNamed(AppRoutes.masuk);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )
                //
              ],
            ),
    );
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("id");
  }

  openwhatsapp() async {
    var whatsapp = "+919144040888";
    var referal = mUser.kodeReferal;
    var whatsappURl_android =
        "whatsapp://send?text=https%3A%2F%2Ffortuna-inv.id%2Fregistrasi%3Freferal%3D$referal";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        notif(context, "whatsapp belum terinstall", "");
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        notif(context, "whatsapp belum terinstall", "");
      }
    }
  }

  jointele() async {
    var telegramGroup = "https://t.me/+nIhie4LIM8g0NzI9";
    await launch(telegramGroup);
  }

  joinwa() async {
    var waGroup = "https://chat.whatsapp.com/DCD6TcSAy6188SwUeiI54x";
    await launch(waGroup);
  }
}
