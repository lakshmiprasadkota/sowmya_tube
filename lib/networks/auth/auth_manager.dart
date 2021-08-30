import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sowmya_youtube/utlis/storage_keys.dart';
import 'package:sowmya_youtube/utlis/urls.dart';

import '../base_network.dart';
import '../base_response.dart';

class AuthManager {
  factory AuthManager() {
    return _singleton;
  }

  AuthManager._internal();

  static final AuthManager _singleton = AuthManager._internal();

  Future<ResponseData> performLogin(String userName , String password) async {
    final formData = FormData.fromMap({
      "username": userName,
      "password": password
    });
    final sharedPreferences = await SharedPreferences.getInstance();

    Response response;
    try {
      response = await dioClient.tokenRef
          .post<dynamic>(URLS.login, data: formData);

      if(response.statusCode == 200) {
        sharedPreferences.setString(StorageKeys.token, response.data["access"]);
        sharedPreferences.setString(StorageKeys.refreshToken, response.data["refresh"]);
        return ResponseData("success", ResponseStatus.SUCCESS);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( 'Please check your internet', ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> preformRegister(String userName, String pass , String rePass) async {
    final formData = FormData.fromMap({
      "username": userName,
      "password": pass,
      "confirm_password": rePass,
    });
    final sharedPreferences = await SharedPreferences.getInstance();

    Response response;
    try {
      response = await dioClient.tokenRef
          .post<dynamic>(URLS.signUp, data: formData);

      if(response.statusCode == 200) {
        sharedPreferences.setString(StorageKeys.token, response.data["access"]);
        sharedPreferences.setString(StorageKeys.refreshToken, response.data["refresh"]);
        // sharedPreferences.setInt(StorageKeys.userId, response.data["user_id"]);
        // sharedPreferences.setInt(StorageKeys.userNumber, response.data["phone_number"]);
        // sharedPreferences.setBool(StorageKeys.isB2B, response.data["is_B2B"]);
        // sharedPreferences.setString(StorageKeys.user, jsonEncode(response.data));
        return ResponseData("Success", ResponseStatus.SUCCESS);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( 'Please check your internet', ResponseStatus.FAILED);
    }
  }

  Future<ResponseData> refreshToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String refresh = sharedPreferences.getString(StorageKeys.refreshToken) ?? "";
    final formData = FormData.fromMap({
      "refresh": refresh,
    });

    Response response;
    try {
      response = await dioClient.tokenRef
          .post<dynamic>(URLS.tokenRefresh, data: formData);

      if(response.statusCode == 200) {
        sharedPreferences.setString(StorageKeys.token, response.data["access"]);
        return ResponseData("", ResponseStatus.SUCCESS);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( err.toString(), ResponseStatus.FAILED);
    }
  }


  Future<void> logout() async {
    await (await SharedPreferences.getInstance()).clear();
    // NavigationService().navigatePage(HomePage());
  }
}

AuthManager authManager = AuthManager();