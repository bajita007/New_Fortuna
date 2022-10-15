import 'package:flutter/material.dart';
import 'package:fortuna/ui/app_routes.dart';
import 'package:fortuna/ui/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', ''), // English, no country code
        Locale('en', ''), // Spanish, no country code
      ],
      title: 'Fortuna Investasi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      // themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.masuk,
      getPages: AppRoutes.routes,
    );
  }
}
