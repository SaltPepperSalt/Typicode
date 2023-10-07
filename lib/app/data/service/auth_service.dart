import 'dart:async';

import 'package:get/get.dart';
import 'package:typicode/app/data/model/user.dart';

class AuthService extends GetxService {
  User? user;

  Future<AuthService> init() async {
    return this;
  }
}
