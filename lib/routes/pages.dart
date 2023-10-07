import 'package:get/get.dart';
import 'package:typicode/app/home/view.dart';
import 'package:typicode/app/login/view.dart';
import 'package:typicode/routes/routes.dart';

class AppPages {
  static final pages = [
    // home
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    // login
    GetPage(
      name: Routes.home,
      page: () => LoginPage(),
    ),
  ];
}
