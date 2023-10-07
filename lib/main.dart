import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/data/provider/provider.dart';
import 'package:typicode/app/login/view.dart';
import 'package:typicode/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initProvider();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Typicode',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      home: LoginPage(),
    );
  }
}

Future<void> initProvider() async {
  Get.put<Provider>(Provider(), permanent: true);
}
