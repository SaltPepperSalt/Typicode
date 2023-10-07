import 'package:get/get.dart';
import 'package:typicode/app/data/model/user.dart';
import 'package:typicode/app/data/provider/base.dart';

extension UserProviderEx on Provider {
  Future<Response<List<User>?>> getWholeAppConfig() {
    return get('/users/', decoder: (data) {
      try {
        if (data != null && data is List) {
          final List<User> parsedUserJson =
              data.map((userJson) => User.fromJson(userJson)).toList();
          return parsedUserJson;
        } else {
          return null;
        }
      } catch (e) {
        // control client side error ex) wrong field
        return null;
      }
    });
  }
}
