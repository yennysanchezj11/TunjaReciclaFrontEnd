import 'dart:convert';

import 'package:flutter_application_1/src/models/models.dart';

import 'dart:convert';

class InfoWasteResponse {
  InfoWasteResponse({
    required this.list,
  });

  List<ListTypeWaste> list;

  factory InfoWasteResponse.fromJson(String str) =>
      InfoWasteResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoWasteResponse.fromMap(Map<String, dynamic> json) =>
      InfoWasteResponse(
        list: List<ListTypeWaste>.from(
            json["list"].map((x) => ListTypeWaste.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
      };
}

class ListTypeWaste {
  ListTypeWaste({
    required this.type,
    required this.categories,
  });

  String type;
  List<Category> categories;

  factory ListTypeWaste.fromJson(String str) =>
      ListTypeWaste.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListTypeWaste.fromMap(Map<String, dynamic> json) => ListTypeWaste(
        type: json["type"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}
