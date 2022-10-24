import 'package:flutter/material.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:fortuna/ui/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    check();
    return GetMaterialApp(
      locale: Get.deviceLocale,


      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,

      ],
      // supportedLocales: const [
      //   Locale('id', ''), // English, no country code
      //   Locale('en', ''), // Spanish, no country code
      // ],
      title: 'Fortuna Investasi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      // themeMode: ThemeMode.dark,

      initialRoute: AppRoutes.masuk,
      getPages: AppRoutes.routes,
    );
  }

  check() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // print("chekc"+lvl_user!);
    if (sharedPreferences.containsKey("id")) {
      Get.offAllNamed(AppRoutes.home);
      // Get.off(()=>testing());
    }
  }
}
