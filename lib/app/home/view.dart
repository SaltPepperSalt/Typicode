import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/home/logic.dart';

class HomePage extends StatelessWidget {
  final HomePageLogic logic = Get.put(HomePageLogic());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${logic.authService.user?.name} Home'),
      ),
      body: Container(
        child: const Center(
          child: Text('home page'),
        ),
      ),
    );
  }
}
