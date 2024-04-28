import 'dart:convert';

class NotificationModel {
  String? message;
  List<Notification>? notifications;

  NotificationModel({
    this.message,
    this.notifications,
  });

  factory NotificationModel.fromRawJson(String str) => NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    message: json["message"],
    notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"]!.map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class Notification {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Notification({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromRawJson(String str) => Notification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"],
    type: json["type"],
    notifiableType: json["notifiable_type"],
    notifiableId: json["notifiable_id"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    readAt: json["read_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "notifiable_type": notifiableType,
    "notifiable_id": notifiableId,
    "data": data?.toJson(),
    "read_at": readAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Data {
  String? message;
  String? description;
  User? user;

  Data({
    this.message,
    this.description,
    this.user,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    description: json["description"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "description": description,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  int? userId;
  int? providerId;
  String? service;
  dynamic catalougeId;
  String? serviceType;
  String? serviceDuration;
  String? price;
  String? date;
  String? time;
  String? status;
  int? advanceMoney;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? isVerified;
  String? image;
  String? latitude;
  String? longitude;
  String? userType;
  String? userStatus;
  String? phoneNumber;
  dynamic address;
  dynamic googleId;
  dynamic facebookId;
  dynamic deletedAt;

  User({
    this.id,
    this.userId,
    this.providerId,
    this.service,
    this.catalougeId,
    this.serviceType,
    this.serviceDuration,
    this.price,
    this.date,
    this.time,
    this.status,
    this.advanceMoney,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isVerified,
    this.image,
    this.latitude,
    this.longitude,
    this.userType,
    this.userStatus,
    this.phoneNumber,
    this.address,
    this.googleId,
    this.facebookId,
    this.deletedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userId: json["user_id"],
    providerId: json["provider_id"],
    service: json["service"],
    catalougeId: json["catalouge_id"],
    serviceType: json["service_type"],
    serviceDuration: json["service_duration"],
    price: json["price"],
    date: json["date"],
    time: json["time"],
    status: json["status"],
    advanceMoney: json["advance_money"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    isVerified: json["is_verified"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    userType: json["user_type"],
    userStatus: json["user_status"],
    phoneNumber: json["phone_number"],
    address: json["address"],
    googleId: json["google_id"],
    facebookId: json["facebook_id"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "provider_id": providerId,
    "service": service,
    "catalouge_id": catalougeId,
    "service_type": serviceType,
    "service_duration": serviceDuration,
    "price": price,
    "date": date,
    "time": time,
    "status": status,
    "advance_money": advanceMoney,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "is_verified": isVerified,
    "image": image,
    "latitude": latitude,
    "longitude": longitude,
    "user_type": userType,
    "user_status": userStatus,
    "phone_number": phoneNumber,
    "address": address,
    "google_id": googleId,
    "facebook_id": facebookId,
    "deleted_at": deletedAt,
  };
}
