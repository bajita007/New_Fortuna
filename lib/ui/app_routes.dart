import 'package:get/get.dart';

import '../HomePage.dart';

class AppRoutes{
  static const home ='/home';


  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),

    ),
  ];
}