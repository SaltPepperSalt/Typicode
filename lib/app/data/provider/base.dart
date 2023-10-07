import 'package:get/get.dart';

class Provider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
    httpClient.maxAuthRetries = 1;
  }
}
