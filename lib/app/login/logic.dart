import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/data/model/user.dart';
import 'package:typicode/app/data/provider/provider.dart';
import 'package:typicode/routes/routes.dart';

class LoginPageLogic extends GetxController {
  final Provider provider = Get.find<Provider>();
  final TextEditingController? emailController = TextEditingController();

  List<User> userList = <User>[];

  RxBool isLoadingUserList = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() async {
    await fetchUserList();
    super.onInit();
  }

  Future<void> fetchUserList() async {
    isError.value = false;
    isLoadingUserList.value = true;
    try {
      Response response = await provider.getUserList();
      if (response.isOk && response.body != null) {
        userList = response.body!;
      } else {
        userList = [];
        isError.value = true;
      }
    } catch (error) {
      // error handle here
      userList = [];
      isError.value = true;
    }
    isLoadingUserList.value = false;
  }

  Future<void> login() async {
    try {
      final User? matchingUser = userList
          .firstWhereOrNull((User user) => user.email == emailController?.text);
      if (matchingUser == null) {
        errorMessage.value = '존재하지 않는 유저입니다.';
      } else {
        Get.offAllNamed(Routes.home);
      }
    } catch (error) {
      // error handle here
      errorMessage.value = '에러가 발생하였습니다. 다시 시도해주세요.';
    }
  }
}
