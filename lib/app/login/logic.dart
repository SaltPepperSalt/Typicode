import 'package:get/get.dart';
import 'package:typicode/app/data/model/user.dart';
import 'package:typicode/app/data/provider/provider.dart';

class LoginPageLogic extends GetxController {
  final Provider provider = Get.find<Provider>();

  List<User> userList = <User>[];

  RxBool isLoadingUserList = true.obs;
  RxBool isError = false.obs;

  @override
  void onInit() async {
    await fetchUserList();
    super.onInit();
  }

  Future<void> fetchUserList() async {
    isError.value = false;
    isLoadingUserList.value = true;
    try {
      Response response = await provider.getUserList();
      if (response.isOk && response.body != null) {
        userList = response.body!;
      } else {
        userList = [];
        isError.value = true;
      }
    } catch (error) {
      // error handle here
      userList = [];
      isError.value = true;
    }
    isLoadingUserList.value = false;
  }
}
