import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sowmya_youtube/models/categoriessss.dart';
import 'package:sowmya_youtube/utlis/urls.dart';

import '../base_network.dart';
import '../base_response.dart';

class CategoriesManager {
  factory CategoriesManager() {
    return _singleton;
  }

  CategoriesManager._internal();

  static final CategoriesManager _singleton = CategoriesManager._internal();

  Future<ResponseData> fetchCategories( ) async {

    Response response;
    try {
      response = await dioClient.ref
          .get<dynamic>(URLS.baseUrl+"/category/?category_id=1");

      if(response.statusCode == 200) {
        CategoriesModel categoriesModel;
        categoriesModel = categoriesModelFromMap(jsonEncode(response.data));
        return ResponseData("success", ResponseStatus.SUCCESS ,data: categoriesModel);
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


}

CategoriesManager categoriesManager = CategoriesManager() ;