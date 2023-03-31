import 'dart:convert';

class Category {
  Category({
    required this.name,
    required this.image,
    required this.color,
    required this.description,
  });

  String name;
  String image;
  String color;
  String description;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
        image: json["image"],
        color: json["color"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "color": color,
        "description": description,
      };
}
