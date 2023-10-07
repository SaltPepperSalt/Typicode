import 'package:get/get.dart';
import 'package:typicode/app/data/service/auth_service.dart';

class HomePageLogic extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  @override
  void onInit() async {
    super.onInit();
  }
}
