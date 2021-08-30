// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromMap(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromMap(String str) => CategoriesModel.fromMap(json.decode(str));

String categoriesModelToMap(CategoriesModel data) => json.encode(data.toMap());

class CategoriesModel {
  CategoriesModel({
    required this.categoryId,
    this.categoryName,
  });

  int categoryId;
  String? categoryName;

  factory CategoriesModel.fromMap(Map<String, dynamic> json) => CategoriesModel(
    categoryId: json["category_id"] == null ? null : json["category_id"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId == null ? null : categoryId,
    "category_name": categoryName == null ? null : categoryName,
  };
}
