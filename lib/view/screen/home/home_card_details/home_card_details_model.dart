import 'dart:convert';

class HomeCardDetailsModel {
  String? status;
  int? totalReview;
  num? avgRating;
  SelonDetails? selonDetails;

  HomeCardDetailsModel({
    this.status,
    this.totalReview,
    this.avgRating,
    this.selonDetails,
  });

  factory HomeCardDetailsModel.fromRawJson(String str) => HomeCardDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeCardDetailsModel.fromJson(Map<String, dynamic> json) => HomeCardDetailsModel(
    status: json["status"],
    totalReview: json["total_review"],
    avgRating: json["avg_rating"] ?? '2',
    selonDetails: json["selon_details"] == null ? null : SelonDetails.fromJson(json["selon_details"]),
  );
  /*factory HomeCardDetailsModel.fromJson(Map<String, dynamic> json) => HomeCardDetailsModel(
    status: json["status"],
    totalReview: json["total_review"],
    avgRating: (json["avg_rating"] as double?)?.toInt(), // Convert double to int
    selonDetails: json["selon_details"] == null ? null : SelonDetails.fromJson(json["selon_details"]),
  );*/


  Map<String, dynamic> toJson() => {
    "status": status,
    "total_review": totalReview,
    "avg_rating": avgRating,
    "selon_details": selonDetails?.toJson(),
  };
}

class SelonDetails {
  int? id;
  int? userId;
  int? categoryId;
  String? businessName;
  String? address;
  String? description;
  List<AvailableServiceOur>? availableServiceOur;
  String? coverPhoto;
  List<String>? gallaryPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? latitude;
  String? longitude;
  List<SalonDetail>? salonDetails;
  List<ProviderRating>? providerRating;

  SelonDetails({
    this.id,
    this.userId,
    this.categoryId,
    this.businessName,
    this.address,
    this.description,
    this.availableServiceOur,
    this.coverPhoto,
    this.gallaryPhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.salonDetails,
    this.providerRating,
  });

  factory SelonDetails.fromRawJson(String str) => SelonDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SelonDetails.fromJson(Map<String, dynamic> json) => SelonDetails(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    businessName: json["business_name"],
    address: json["address"],
    description: json["description"],
    availableServiceOur: json["available_service_our"] == null ? [] : List<AvailableServiceOur>.from(json["available_service_our"]!.map((x) => AvailableServiceOur.fromJson(x))),
    coverPhoto: json["cover_photo"],
    gallaryPhoto: json["gallary_photo"] == null ? [] : List<String>.from(json["gallary_photo"]!.map((x) => x)),
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    latitude: json["latitude"],
    longitude: json["longitude"],
    salonDetails: json["salon_details"] == null ? [] : List<SalonDetail>.from(json["salon_details"]!.map((x) => SalonDetail.fromJson(x))),
    providerRating: json["provider_rating"] == null ? [] : List<ProviderRating>.from(json["provider_rating"]!.map((x) => ProviderRating.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "business_name": businessName,
    "address": address,
    "description": description,
    "available_service_our": availableServiceOur == null ? [] : List<dynamic>.from(availableServiceOur!.map((x) => x.toJson())),
    "cover_photo": coverPhoto,
    "gallary_photo": gallaryPhoto == null ? [] : List<dynamic>.from(gallaryPhoto!.map((x) => x)),
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "latitude": latitude,
    "longitude": longitude,
    "salon_details": salonDetails == null ? [] : List<dynamic>.from(salonDetails!.map((x) => x.toJson())),
    "provider_rating": providerRating == null ? [] : List<dynamic>.from(providerRating!.map((x) => x.toJson())),
  };
}

class AvailableServiceOur {
  String? day;
  String? startTime;
  String? endTime;

  AvailableServiceOur({this.day, this.startTime, this.endTime});

  AvailableServiceOur.fromJson(Map<String, dynamic> json) {
    day = json['Day'];
    startTime = json['Start Time'];
    endTime = json['End Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Day'] = day;
    data['Start Time'] = startTime;
    data['End Time'] = endTime;
    return data;
  }
}

enum Time {
  THE_1036
}

final timeValues = EnumValues({
  "10:36": Time.THE_1036
});

class ProviderRating {
  int? id;
  int? userId;
  int? serviceId;
  int? providerId;
  int? catalogueId;
  String? review;
  int? rating;
  int? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  ProviderRating({
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
    this.user,
  });

  factory ProviderRating.fromRawJson(String str) => ProviderRating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProviderRating.fromJson(Map<String, dynamic> json) => ProviderRating(
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
    user: json["user"] == null ? null : User.fromJson(json["user"]),
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
    "created_at": createdAt ?? '',
    "updated_at": updatedAt ?? '',
    "user": user?.toJson(),
  };
}

class User {
  int? id;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic googleId;
  dynamic deletedAt;

  User({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.googleId,
    this.deletedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    googleId: json["google_id"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "google_id": googleId,
    "deleted_at": deletedAt,
  };
}

class SalonDetail {
  int? id;
  int? categoryId;
  int? providerId;
  String? serviceName;
  String? serviceDescription;
  List<String>? gallaryPhoto;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? setBookingMony;
  List<AvailableServiceOur>? availableServiceOur;
  dynamic createdAt;
  DateTime? updatedAt;

  SalonDetail({
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
  });

  factory SalonDetail.fromRawJson(String str) => SalonDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalonDetail.fromJson(Map<String, dynamic> json) => SalonDetail(
    id: json["id"],
    categoryId: json["category_id"],
    providerId: json["provider_id"],
    serviceName: json["service_name"],
    serviceDescription: json["service_description"],
    gallaryPhoto: json["gallary_photo"] == null ? [] : List<String>.from(json["gallary_photo"]!.map((x) => x)),
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    setBookingMony: json["set_booking_mony"],
    availableServiceOur: json["available_service_our"] == null ? [] : List<AvailableServiceOur>.from(json["available_service_our"]!.map((x) => AvailableServiceOur.fromJson(x))),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "provider_id": providerId,
    "service_name": serviceName,
    "service_description": serviceDescription,
    "gallary_photo": gallaryPhoto == null ? [] : List<dynamic>.from(gallaryPhoto!.map((x) => x)),
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "set_booking_mony": setBookingMony,
    "available_service_our": availableServiceOur == null ? [] : List<dynamic>.from(availableServiceOur!.map((x) => x.toJson())),
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
