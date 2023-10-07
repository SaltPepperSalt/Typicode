import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  final LoginPageLogic logic = Get.put(LoginPageLogic());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => logic.isError.value
                  ? const Text('Error Detected Press Refresh Button')
                  : const Text('Type Email To login'),
            ),
            TextField(),
            const SizedBox(
              height: 40.0,
            ),
            Obx(
              () => logic.isError.value
                  ? TextButton(
                      onPressed: () {
                        logic.fetchUserList();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: const Size(160, 20),
                      ),
                      child: logic.isLoadingUserList.value
                          ? const SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                            )
                          : const Text('Tap To Refresh'),
                    )
                  : TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: const Size(80, 20),
                      ),
                      child: logic.isLoadingUserList.value
                          ? const SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                            )
                          : const Text('Login'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
