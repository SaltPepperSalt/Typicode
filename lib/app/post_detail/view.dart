import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode/app/post_detail/logic.dart';

class PostDetailPage extends StatelessWidget {
  PostDetailPage({super.key});

  final PostDetailPageLogic logic =
      Get.put(PostDetailPageLogic(), tag: Get.parameters['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Obx(
        () => logic.isLoadingPostForDetail.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.people),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(logic.postForDetail?.value.userNmae ?? ''),
                        ],
                      ),
                      Text(
                        logic.postForDetail?.value.title ?? '',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(logic.postForDetail?.value.body ?? ''),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (logic.postForDetail?.value.userNmae ==
                          logic.authService.user?.userName)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: logic.deletePost,
                            child: const Text('delete'),
                          ),
                        ),
                      const Divider(
                        height: 1.0,
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      ...List.generate(
                        logic.postForDetail?.value.commets?.length ?? 0,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                logic.postForDetail!.value.commets?[index]
                                        .email ??
                                    '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                logic.postForDetail!.value.commets?[index]
                                        .body ??
                                    '',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
