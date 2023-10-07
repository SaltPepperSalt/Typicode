import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:typicode/app/data/model/user.dart';

class Storage {
  static final Storage _singleton = Storage._internal();

  factory Storage() {
    return _singleton;
  }

  Storage._internal();

  dynamic __read(String key) async {
    try {
      const FlutterSecureStorage storage = FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
      return await storage.read(key: key);
    } on Exception {
      // hanle error here
      return null;
    }
  }

  Future<void> __write(String key, dynamic value) async {
    try {
      const FlutterSecureStorage storage = FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
      await storage.write(key: key, value: value);
    } on Exception catch (error) {
      // hanle error here
      return;
    }
  }

  Future<void> __delete(String key) async {
    if (GetPlatform.isWeb) {
      // https://pub.dev/packages/shared_preferences
    } else {
      try {
        const FlutterSecureStorage storage = FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        );
        await storage.delete(key: key);
      } on Exception catch (error) {
        // hanle error here
        return;
      }
    }
  }

  Future<User?> getUser() async {
    var json = await __read('USER');
    if (json != null) {
      return User.fromJson(jsonDecode(json));
    }
    return null;
  }

  Future<void> saveUser(User user) async {
    await __write('USER', jsonEncode(user.toJson()));
  }

  Future<void> deleteUser() async {
    await __delete('USER');
  }

  Future<List<User>?> getUserList() async {
    var json = await __read('USER_LIST');
    if (json != null) {
      List decodedJson = jsonDecode(json);
      List<User> parsedUserList =
          decodedJson.map((json) => User.fromJson(json)).toList();
      return parsedUserList;
    }
    return null;
  }

  Future<void> saveUserList(List<User> userList) async {
    await __write('USER_LIST', jsonEncode(userList));
  }

  Future<void> deleteUserList() async {
    await __delete('USER_LIST');
  }

  Future<void> deleteAll() async {
    const FlutterSecureStorage storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    await storage.deleteAll();
  }
}
