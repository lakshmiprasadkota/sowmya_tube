//
// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sowmya_youtube/models/categories.dart';
// import 'package:sowmya_youtube/networks/base_network.dart';
// import 'package:sowmya_youtube/networks/base_response.dart';
//
// final getDataFuture = ChangeNotifierProvider<GetDataFromApi>((ref)=>GetDataFromApi());
//
// class GetDataFromApi extends ChangeNotifier{
//   Categories? model;
// GetDataFromApi(){
//     getData();
// }
// Future getData() async {
//   Response response;
//   try {
//     response = await dioClient.ref
//         .get<dynamic>("https://sowmyamatsa.pythonanywhere.com/channel/?channel_id=1");
//   } on Exception catch (_) {
//     return ResponseData<dynamic>(
//         'Please check your internet', ResponseStatus.FAILED);
//   }
//   if (response.statusCode == 200) {
//        model =
//     categoriesFromMap(jsonEncode(response.data));
//     return ResponseData<dynamic>("", ResponseStatus.SUCCESS, data: model);
//   }
//   notifyListeners();
// }
// }