import 'dart:convert';

class HomeFeaturedModel {
  String? status;
  List<Message>? message;

  HomeFeaturedModel({
    this.status,
    this.message,
  });

  factory HomeFeaturedModel.fromRawJson(String str) => HomeFeaturedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeFeaturedModel.fromJson(Map<String, dynamic> json) => HomeFeaturedModel(
    status: json["status"],
    message: json["data"] == null ? [] : List<Message>.from(json["data"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": message == null ? [] : List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class Message {
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

  Message({
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

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
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
    averageRating: json["average_rating"]?.toDouble() ?? 0.0,
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
    "average_rating": averageRating ,
  };
}
