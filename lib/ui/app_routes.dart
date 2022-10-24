import 'package:fortuna/Screen/BiodataPage.dart';
import 'package:fortuna/Screen/Deposit/DepositScreen.dart';
import 'package:fortuna/Screen/DetailsProduk.dart';
import 'package:fortuna/Screen/LoginScreen.dart';
import 'package:fortuna/Screen/ProdukAktifPage.dart';
import 'package:fortuna/Screen/Withdraw/WithdrawScreen.dart';
import 'package:get/get.dart';

import '../HomePage.dart';
import '../Screen/Deposit/WebViewPayment.dart';
import '../Screen/RegisterScreeen.dart';

class AppRoutes {
  static const home = '/home';
  static const masuk = '/masuk';
  static const daftar = '/daftar';
  static const produk = '/detail-produk';
  static const topup = '/topup';
  static const withdraw = '/withdraw';
  static const biodata = '/biodata';
  static const webPay = '/webPay';
  static const produkSaya = '/produk-saya';

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
    GetPage(
      name: produk,
      page: () =>  DetailsProduk(),
    ),
    GetPage(
        name: topup,
        page: () =>  DepositScreen(),
    ),
    GetPage(
      name: withdraw,
      page: () =>  WithdrawScreen(),
    ),
    GetPage(
      name: biodata,
      page: () =>  BiodataPage(),
    ),
    GetPage(
      name: webPay,
      page: () =>  PaymentWebView(),
    ),
    GetPage(
      name: produkSaya,
      page: () =>  ProdukAktifPage(),
    ),
  ];
}
