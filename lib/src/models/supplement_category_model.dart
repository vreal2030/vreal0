// To parse this JSON data, do
//
//     final supplementCategory = supplementCategoryFromJson(jsonString);

import 'dart:convert';

SupplementCategory supplementCategoryFromJson(String str) =>
    SupplementCategory.fromJson(json.decode(str));

String supplementCategoryToJson(SupplementCategory data) =>
    json.encode(data.toJson());

class SupplementCategory {
  int index;
  String title;
  String imageUrl;

  SupplementCategory({
    required this.index,
    required this.title,
    required this.imageUrl,
  });

  factory SupplementCategory.fromJson(Map<String, dynamic> json) =>
      SupplementCategory(
        index: json["index"],
        title: json["title"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "title": title,
        "imageUrl": imageUrl,
      };
}
