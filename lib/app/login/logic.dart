import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/data/model/user.dart';
import 'package:typicode/app/data/provider/provider.dart';
import 'package:typicode/app/data/service/auth_service.dart';

class LoginPageLogic extends GetxController {
  final Provider provider = Get.find<Provider>();
  final AuthService authService = Get.find<AuthService>();
  final TextEditingController? emailController = TextEditingController();

  List<User> userList = <User>[];

  RxBool isLoadingUserList = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() async {
    await checkStorageStoredUserList();
    super.onInit();
  }

  Future<void> checkStorageStoredUserList() async {
    List<User>? storedUserList = await authService.readUserList();
    if (storedUserList != null) {
      userList = storedUserList;
      isLoadingUserList.value = false;
    } else {
      await fetchUserList();
    }
  }

  Future<void> fetchUserList() async {
    isLoadingUserList.value = true;
    isError.value = false;
    try {
      Response response = await provider.getUserList();
      if (response.isOk && response.body != null) {
        userList = response.body!;
        authService.saveUserList(userList);
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

  User? login() {
    try {
      final User? matchingUser = userList
          .firstWhereOrNull((User user) => user.email == emailController?.text);
      if (matchingUser == null) {
        errorMessage.value = '존재하지 않는 유저입니다.';
        return null;
      } else {
        return matchingUser;
      }
    } catch (error) {
      // error handle here
      errorMessage.value = '에러가 발생하였습니다. 다시 시도해주세요.';
      return null;
    }
  }
}
