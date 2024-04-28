import 'dart:convert';

class CategoryModel {
  String? status;
  List<CategoryMessage>? message;

  CategoryModel({
    this.status,
    this.message,
  });

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    message: json["data"] == null
        ? []
        : List<CategoryMessage>.from(
        json["data"]!.map((x) => CategoryMessage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": message == null
        ? []
        : List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class CategoryMessage {
  int? id;
  String? categoryName;
  String? categoryImage;

  CategoryMessage({
    this.id,
    this.categoryName,
    this.categoryImage,
  });

  factory CategoryMessage.fromRawJson(String str) => CategoryMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryMessage.fromJson(Map<String, dynamic> json) => CategoryMessage(
    id: json["id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
