import 'dart:convert';

class HomeServiceDetailsModel {
  String? status;
  List<Message>? message;

  HomeServiceDetailsModel({
    this.status,
    this.message,
  });

  factory HomeServiceDetailsModel.fromRawJson(String str) => HomeServiceDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeServiceDetailsModel.fromJson(Map<String, dynamic> json) => HomeServiceDetailsModel(
    status: json["status"],
    message: json["message"] == null ? [] : List<Message>.from(json["message"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class Message {
  int? id;
  int? categoryId;
  int? providerId;
  String? serviceName;
  String? serviceDescription;
  String? gallaryPhoto;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? setBookingMony;
  String? availableServiceOur;
  dynamic createdAt;
  dynamic updatedAt;
  List<ServiceRating>? serviceRating;

  Message({
    this.id,
    this.categoryId,
    this.providerId,
    this.serviceName,
    this.serviceDescription,
    this.gallaryPhoto,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
    this.setBookingMony,
    this.availableServiceOur,
    this.createdAt,
    this.updatedAt,
    this.serviceRating,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    categoryId: json["category_id"],
    providerId: json["provider_id"],
    serviceName: json["service_name"],
    serviceDescription: json["service_description"],
    gallaryPhoto: json["gallary_photo"],
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    setBookingMony: json["set_booking_mony"],
    availableServiceOur: json["available_service_our"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    serviceRating: json["service_rating"] == null ? [] : List<ServiceRating>.from(json["service_rating"]!.map((x) => ServiceRating.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "provider_id": providerId,
    "service_name": serviceName,
    "service_description": serviceDescription,
    "gallary_photo": gallaryPhoto,
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "set_booking_mony": setBookingMony,
    "available_service_our": availableServiceOur,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "service_rating": serviceRating == null ? [] : List<dynamic>.from(serviceRating!.map((x) => x.toJson())),
  };
}

class ServiceRating {
  int? id;
  int? userId;
  int? serviceId;
  int? providerId;
  int? catalogueId;
  String? review;
  int? rating;
  int? status;
  dynamic createdAt;
  dynamic updatedAt;

  ServiceRating({
    this.id,
    this.userId,
    this.serviceId,
    this.providerId,
    this.catalogueId,
    this.review,
    this.rating,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceRating.fromRawJson(String str) => ServiceRating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceRating.fromJson(Map<String, dynamic> json) => ServiceRating(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    providerId: json["provider_id"],
    catalogueId: json["catalogue_id"],
    review: json["review"],
    rating: json["rating"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "service_id": serviceId,
    "provider_id": providerId,
    "catalogue_id": catalogueId,
    "review": review,
    "rating": rating,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
