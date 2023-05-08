// To parse this JSON data, do
//
//     final mainColumn = mainColumnFromJson(jsonString);

import 'dart:convert';

MainColumn mainColumnFromJson(String str) =>
    MainColumn.fromJson(json.decode(str));

String mainColumnToJson(MainColumn data) => json.encode(data.toJson());

class MainColumn {
  int index;
  String title;
  String subtitle;
  String url;
  String imageUrl;
  String docId;

  MainColumn({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.imageUrl,
    required this.docId,
  });

  factory MainColumn.fromJson(Map<String, dynamic> json) => MainColumn(
        index: json["index"],
        title: json["title"],
        subtitle: json["subtitle"],
        url: json["url"],
        imageUrl: json["imageUrl"],
        docId: json["docId"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "title": title,
        "subtitle": subtitle,
        "url": url,
        "imageUrl": imageUrl,
        "docId": docId,
      };
}
