import 'package:flutter/material.dart';
import 'package:fortuna/ui/app_assets.dart';
import 'package:fortuna/ui/app_colors.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          color: kMerah,
          child: Column(
            children: [
              Image.asset(
                Gambar.logo,
                color: Colors.white,
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,

                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(Gambar.logo),
                        ),
                      ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: const [
                          Text("Saldo Dompet"),
                        ],
                      )

                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
