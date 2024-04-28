import 'dart:convert';

class AboutPrivacyTermsModel {
  String? message;
  List<Datum>? data;

  AboutPrivacyTermsModel({
    this.message,
    this.data,
  });

  factory AboutPrivacyTermsModel.fromRawJson(String str) => AboutPrivacyTermsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutPrivacyTermsModel.fromJson(Map<String, dynamic> json) => AboutPrivacyTermsModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? pageTitle;
  String? pageDescription;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.pageTitle,
    this.pageDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    pageTitle: json["page_title"],
    pageDescription: json["page_description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page_title": pageTitle,
    "page_description": pageDescription,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
