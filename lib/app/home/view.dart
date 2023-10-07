import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/core/utils/double_back_terminate.dart';
import 'package:typicode/app/home/logic.dart';
import 'package:typicode/routes/routes.dart';

class HomePage extends StatelessWidget {
  final HomePageLogic logic = Get.put(HomePageLogic());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleBackTerminate(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${logic.authService.user?.name} Home'),
          actions: [
            TextButton(
              onPressed: () {
                logic.authService.logout();
                Get.offAllNamed(Routes.login);
              },
              child: const Text('logout'),
            ),
          ],
        ),
        body: Center(
          child: Obx(
            () => logic.isLoadingPostForLists.value
                ? const CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Get.toNamed(
                          '${Routes.postDetail}/${logic.postForLists[index].value.id.toString()}',
                        );
                      },
                      title: Text('${logic.postForLists[index].value.title}'),
                      trailing: Obx(
                        () => Text(
                            'comments : ${logic.postForLists[index].value.commentCount}'),
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    itemCount: logic.postForLists.length,
                  ),
          ),
        ),
      ),
    );
  }
}
