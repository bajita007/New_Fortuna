import 'package:fortuna/Screen/LoginScreen.dart';
import 'package:get/get.dart';

import '../HomePage.dart';
import '../Screen/RegisterScreeen.dart';

class AppRoutes {
  static const home = '/home';
  static const masuk = '/masuk';
  static const daftar = '/daftar';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: masuk,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: daftar,
      page: () => const RegisterScreen(),
    ),
  ];
}
