import 'package:get/get.dart';
import 'package:typicode/app/data/model/posts.dart';
import 'package:typicode/app/data/provider/provider.dart';
import 'package:typicode/app/data/service/auth_service.dart';

class HomePageLogic extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  List<Rx<PostForList>> postForLists = <Rx<PostForList>>[];

  RxBool isLoadingPostForLists = true.obs;

  @override
  void onInit() async {
    fetchPostForLists();
    super.onInit();
  }

  Future<void> fetchPostForLists() async {
    isLoadingPostForLists.value = true;
    final Provider provider = Get.find<Provider>();
    try {
      final Response response = await provider.getPostForLists();
      if (response.isOk && response.body != null) {
        postForLists = response.body!;
      } else {
        postForLists = [];
      }
    } catch (error) {
      postForLists = [];
    }
    isLoadingPostForLists.value = false;
  }
}
