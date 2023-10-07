import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/core/utils/storage.dart';
import 'package:typicode/app/data/model/user.dart';
import 'package:typicode/app/login/logic.dart';
import 'package:typicode/routes/routes.dart';

class AuthService extends GetxService {
  User? user;

  Future<AuthService> init() async {
    await _readUser();
    return this;
  }

  Future<void> _readUser() async {
    Storage storage = Storage();
    var userResult = await storage.getUser();
    if (userResult != null) {
      user = userResult;
    }
  }

  Future<void> _saveUser() async {
    if (user != null) {
      Storage storage = Storage();
      storage.saveUser(user!);
    }
  }

  Future<List<User>?> readUserList() async {
    Storage storage = Storage();
    var userResult = await storage.getUserList();
    if (userResult != null) {
      return userResult;
    }
    return null;
  }

  Future<void> saveUserList(List<User> userList) async {
    Storage storage = Storage();
    storage.saveUserList(userList);
  }

  Future<void> processLogin(User? Function() loginFn) async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    final User? result = loginFn();
    try {
      if (result != null) {
        user = result;
        await _saveUser();
        if (Get.isDialogOpen ?? false) Get.back(); // turn off progress
        await _onLoginPerformed(true);
      } else {
        if (Get.isDialogOpen ?? false) Get.back(); // turn off progress
        await _onLoginPerformed(false);
      }
    } catch (error) {
      // handle error here
      if (Get.isDialogOpen ?? false) Get.back(); // turn off progress
      await _onLoginPerformed(false);
    }
  }

  Future<void> _onLoginPerformed(bool result) async {
    if (result) {
      Get.offAllNamed(Routes.home);
      if (Get.isRegistered<LoginPageLogic>()) {
        Get.delete<LoginPageLogic>();
      }
    } else {
      logout();
    }
  }

  void _clearUser() {
    user = null;
    Storage storage = Storage();
    storage.deleteUser();
  }

  void logout() {
    _clearUser();
  }
}
