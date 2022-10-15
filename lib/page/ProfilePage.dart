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
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
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
                      children: const [
                        Text(
                          "Saldo Dompet",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Rp.1.000.000",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
