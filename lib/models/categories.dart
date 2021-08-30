// // To parse this JSON data, do
// //
// //     final categories = categoriesFromMap(jsonString);
//
// import 'dart:convert';
//
// Categories categoriesFromMap(String str) => Categories.fromMap(json.decode(str));
//
// String categoriesToMap(Categories data) => json.encode(data.toMap());
//
// class Categories {
//   Categories({
//     required this.user,
//     required this.channelId,
//     required this.categoryId,
//     this.name,
//     this.banner,
//     this.profilePic,
//     this.description,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int user;
//   int channelId;
//   int categoryId;
//   String? name;
//   String? banner;
//   String? profilePic;
//   String? description;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory Categories.fromMap(Map<String, dynamic> json) => Categories(
//     user: json["user"] == null ? null : json["user"],
//     channelId: json["channel_id"] == null ? null : json["channel_id"],
//     categoryId: json["category_id"] == null ? null : json["category_id"],
//     name: json["name"] == null ? null : json["name"],
//     banner: json["banner"] == null ? null : json["banner"],
//     profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
//     description: json["description"] == null ? null : json["description"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "user": user == null ? null : user,
//     "channel_id": channelId == null ? null : channelId,
//     "category_id": categoryId == null ? null : categoryId,
//     "name": name == null ? null : name,
//     "banner": banner == null ? null : banner,
//     "profile_pic": profilePic == null ? null : profilePic,
//     "description": description == null ? null : description,
//     "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//     "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//   };
// }
