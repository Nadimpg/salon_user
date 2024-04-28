import 'dart:convert';

class SearchModel {
  String? message;
  List<Datum>? data;

  SearchModel({
    this.message,
    this.data,
  });

  factory SearchModel.fromRawJson(String str) => SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
  int? userId;
  int? categoryId;
  String? businessName;
  String? address;
  String? description;
  String? coverPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? latitude;
  String? longitude;
  double? distance;
  double? averageRating;

  Datum({
    this.id,
    this.userId,
    this.categoryId,
    this.businessName,
    this.address,
    this.description,
    this.coverPhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.distance,
    this.averageRating,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    businessName: json["business_name"],
    address: json["address"],
    description: json["description"],
    coverPhoto: json["cover_photo"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    latitude: json["latitude"],
    longitude: json["longitude"],
    distance: json["distance"]?.toDouble(),
    averageRating: json["average_rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "business_name": businessName,
    "address": address,
    "description": description,
    "cover_photo": coverPhoto,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "latitude": latitude,
    "longitude": longitude,
    "distance": distance,
    "average_rating": averageRating,
  };
}
