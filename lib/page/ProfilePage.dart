import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortuna/Style/StyleButton.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:fortuna/widget/ButtonHeaderProfile.dart';
import 'package:get/get.dart';

import '../widget/ButtonProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
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
                          backgroundImage: AssetImage(Gambar.icons_profile),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children:  const [
                          Text(
                            "Saldo Utama",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rp.1.000.000",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),


                          ),
                          SizedBox(height: 5,),
                          Text.rich(TextSpan(children: [
                              TextSpan(
                              text: "Saldo Tertahan ", style: TextStyle(color: Colors.white)),
                            //Paket aktif
                            TextSpan(
                              text: "RP. 1.200.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.white),
                            ),])),



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

                        child: StyleButtonIcons(context: context, navigator: (){
                          Get.toNamed(AppRoutes.topup);
                        },
                            title: "Tambah Dana", icons: Icons.account_balance_wallet)),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: StyleButtonIcons(context: context, navigator: (){
                          Get.toNamed(AppRoutes.withdraw);

                        },
                            title: "Tarik Dana", icons: Icons.upload_outlined)),

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
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonProfile(
                    context: context,
                    iconPath: Icons.supervised_user_circle_outlined,
                    title: "Ajak Teman",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonProfile(
                    context: context,
                    iconPath: Icons.card_giftcard,
                    title: "Reedem Code",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonProfile(
                    context: context,
                    iconPath: FontAwesomeIcons.whatsapp,
                    title: "Join Group Whatsapp",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonProfile(
                    context: context,
                    iconPath: FontAwesomeIcons.telegram,
                    title: "Join Group Telegram",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonProfile(
                    context: context,
                    iconPath: FontAwesomeIcons.signOut,
                    title: "Keluar",
                    onTap: () {},
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
}
