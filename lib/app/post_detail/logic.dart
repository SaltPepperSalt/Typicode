import 'package:get/get.dart';
import 'package:typicode/app/data/model/posts.dart';
import 'package:typicode/app/data/provider/provider.dart';
import 'package:typicode/app/data/service/auth_service.dart';
import 'package:typicode/app/home/logic.dart';

class PostDetailPageLogic extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  late Rx<PostForDetail>? postForDetail;

  RxBool isLoadingPostForDetail = true.obs;

  @override
  void onInit() async {
    fetchPostForDetail();
    super.onInit();
  }

  Future<void> fetchPostForDetail() async {
    if (Get.parameters['id'] == null ||
        int.tryParse(Get.parameters['id']!) == null) {
      Get.back();
    }

    isLoadingPostForDetail.value = true;
    final Provider provider = Get.find<Provider>();
    try {
      final Response response =
          await provider.getPostDetail(int.tryParse(Get.parameters['id']!)!);
      if (response.isOk && response.body != null) {
        postForDetail = response.body!;
        String? postOwnerNickname = (await authService.readUserList())
            ?.firstWhere((element) => element.id == postForDetail?.value.userId)
            .userName;
        postForDetail!.value.userNmae = postOwnerNickname ?? '';
      } else {
        postForDetail = null;
        Get.back();
      }
    } catch (error) {
      postForDetail = null;
      Get.back();
    }
    isLoadingPostForDetail.value = false;
  }

  Future<void> deletePost() async {
    if (postForDetail == null) return;
    final Provider provider = Get.find<Provider>();
    final Response response =
        await provider.deletePost(postForDetail!.value.id);

    if (response.isOk) {
      if (Get.isRegistered<HomePageLogic>()) {
        final HomePageLogic homePageLogic = Get.find<HomePageLogic>();
        homePageLogic.fetchPostForLists();
      }
      Get.back();
      Get.snackbar('글을 삭제하였습니다.', '${postForDetail?.value.title} 삭제됨');
    } else {
      // error handle
    }
  }
}
