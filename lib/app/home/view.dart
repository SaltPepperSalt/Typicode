import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/home/logic.dart';
import 'package:typicode/routes/routes.dart';

class HomePage extends StatelessWidget {
  final HomePageLogic logic = Get.put(HomePageLogic());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${logic.authService.user?.name} Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: TextButton(
            onPressed: () {
              logic.authService.logout();
              Get.offAllNamed(Routes.login);
            },
            child: const Text('logout'),
          ),
        ),
      ),
    );
  }
}
