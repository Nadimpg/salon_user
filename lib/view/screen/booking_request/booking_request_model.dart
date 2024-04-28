/*import 'dart:convert';

class BookingRequestModel {
  List<Datum>? data;
  Pagination? pagination;

  BookingRequestModel({
    this.data,
    this.pagination,
  });

  factory BookingRequestModel.fromRawJson(String str) => BookingRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) => BookingRequestModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  Booking? booking;
  List<CatalogDetail>? catalogDetails;

  Datum({
    this.booking,
    this.catalogDetails,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
    catalogDetails: json["catalog_details"] == null ? [] : List<CatalogDetail>.from(json["catalog_details"]!.map((x) => CatalogDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "booking": booking?.toJson(),
    "catalog_details": catalogDetails == null ? [] : List<dynamic>.from(catalogDetails!.map((x) => x.toJson())),
  };
}

class Booking {
  int? id;
  int? userId;
  int? providerId;
  String? service;
  ServiceType? serviceType;
  String? serviceDuration;
  String? price;
  String? date;
  String? time;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Booking({
    this.id,
    this.userId,
    this.providerId,
    this.service,
    this.serviceType,
    this.serviceDuration,
    this.price,
    this.date,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    userId: json["user_id"],
    providerId: json["provider_id"],
    service: json["service"],
    serviceType: serviceTypeValues.map[json["service_type"]]!,
    serviceDuration: json["service_duration"],
    price: json["price"],
    date: json["date"],
    time: json["time"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "provider_id": providerId,
    "service": service,
    "service_type": serviceTypeValues.reverse[serviceType],
    "service_duration": serviceDuration,
    "price": price,
    "date": date,
    "time": time,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user": user?.toJson(),
  };
}

enum ServiceType {
  HOME_SERVICE,
  SALON_SERVICE
}

final serviceTypeValues = EnumValues({
  "Home Service": ServiceType.HOME_SERVICE,
  "Salon Service": ServiceType.SALON_SERVICE
});

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? isVerified;
  String? image;
  String? latitude;
  String? longitude;
  UserType? userType;
  String? userStatus;
  String? phoneNumber;
  String? address;
  dynamic googleId;
  dynamic facebookId;
  DateTime? createdAt;
  DateTime? updatedAt;
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
    this.googleId,
    this.facebookId,
    this.createdAt,
    this.updatedAt,
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
    userType: userTypeValues.map[json["user_type"]]!,
    userStatus: json["user_status"],
    phoneNumber: json["phone_number"],
    address: json["address"],
    googleId: json["google_id"],
    facebookId: json["facebook_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "user_type": userTypeValues.reverse[userType],
    "user_status": userStatus,
    "phone_number": phoneNumber,
    "address": address,
    "google_id": googleId,
    "facebook_id": facebookId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

*//*enum Address {
  DHAKA
}

final addressValues = EnumValues({
  "dhaka": Address.DHAKA
});*//*

*//*enum Email {
  SOKOREY431_GIRATEX_COM
}

final emailValues = EnumValues({
  "sokorey431@giratex.com": Email.SOKOREY431_GIRATEX_COM
});*//*

*//*enum UserImage {
  DUMMY_IMG_DEFAULT_JPG
}

final userImageValues = EnumValues({
  "dummyImg/default.jpg": UserImage.DUMMY_IMG_DEFAULT_JPG
});*//*





enum UserType {
  USER
}

final userTypeValues = EnumValues({
  "user": UserType.USER
});

class CatalogDetail {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  String? image;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? bookingMoney;
  String? serviceHour;
  DateTime? createdAt;
  DateTime? updatedAt;

  CatalogDetail({
    this.id,
    this.providerId,
    this.serviceId,
    this.catalogName,
    this.catalogDescription,
    this.image,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
    this.bookingMoney,
    this.serviceHour,
    this.createdAt,
    this.updatedAt,
  });

  factory CatalogDetail.fromRawJson(String str) => CatalogDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalogDetail.fromJson(Map<String, dynamic> json) => CatalogDetail(
    id: json["id"],
    providerId: json["provider_id"],
    serviceId: json["service_id"],
    catalogName: json["catalog_name"],
    catalogDescription: json["catalog_description"],
    image: json["image"],
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    bookingMoney: json["booking_money"],
    serviceHour: json["service_hour"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_id": providerId,
    "service_id": serviceId,
    "catalog_name": catalogName,
    "catalog_description": catalogDescription,
    "image": image,
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "booking_money": bookingMoney,
    "service_hour": serviceHour,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

*//*enum CatalogName {
  CATALOG_NAME_CATALOUGE_2,
  CATALOUGE_2,
  CATELOUGE,
  HAIRCUT_JUSEF
}

final catalogNameValues = EnumValues({
  "Catalouge 2": CatalogName.CATALOG_NAME_CATALOUGE_2,
  "catalouge 2": CatalogName.CATALOUGE_2,
  "Catelouge": CatalogName.CATELOUGE,
  "Haircut jusef": CatalogName.HAIRCUT_JUSEF
});*//*

*//*enum CatalogDetailImage {
  IMAGES_1707128652_SCREENSHOT_20230904174936_PNG,
  IMAGES_1707129035_DOWNLOAD_2_JPG,
  IMAGES_1707129846_IMAGES_15_JPG
}

final catalogDetailImageValues = EnumValues({
  "[\"images\\/1707128652.Screenshot 2023-09-04 174936.png\"]": CatalogDetailImage.IMAGES_1707128652_SCREENSHOT_20230904174936_PNG,
  "[\"images\\/1707129035.download (2).jpg\"]": CatalogDetailImage.IMAGES_1707129035_DOWNLOAD_2_JPG,
  "[\"images\\/1707129846.images (15).jpg\"]": CatalogDetailImage.IMAGES_1707129846_IMAGES_15_JPG
});*//*

class Pagination {
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? total;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    perPage: json["per_page"],
    total: json["total"],
    nextPageUrl: json["next_page_url"],
    prevPageUrl: json["prev_page_url"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "total_pages": totalPages,
    "per_page": perPage,
    "total": total,
    "next_page_url": nextPageUrl,
    "prev_page_url": prevPageUrl,
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
}*/
import 'dart:convert';

class BookingRequestModel {
  List<Datum>? data;
  Pagination? pagination;

  BookingRequestModel({
    this.data,
    this.pagination,
  });

  factory BookingRequestModel.fromRawJson(String str) => BookingRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) => BookingRequestModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  Booking? booking;
  List<CatalogDetail>? catalogDetails;

  Datum({
    this.booking,
    this.catalogDetails,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
    catalogDetails: json["catalog_details"] == null ? [] : List<CatalogDetail>.from(json["catalog_details"]!.map((x) => CatalogDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "booking": booking?.toJson(),
    "catalog_details": catalogDetails == null ? [] : List<dynamic>.from(catalogDetails!.map((x) => x.toJson())),
  };
}

class Booking {
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
  int? status;
  int? advanceMoney;
  DateTime? createdAt;
  DateTime? updatedAt;
  Provider? provider;
  User? user;

  Booking({
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
    this.provider,
    this.user,
  });

  factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
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
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
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
    "provider": provider?.toJson(),
    "user": user?.toJson(),
  };
}

class Provider {
  int? id;
  int? userId;
  int? categoryId;
  String? businessName;
  String? address;
  String? description;
  String? availableServiceOur;
  String? coverPhoto;
  String? latitude;
  String? longitude;
  String? gallaryPhoto;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Provider({
    this.id,
    this.userId,
    this.categoryId,
    this.businessName,
    this.address,
    this.description,
    this.availableServiceOur,
    this.coverPhoto,
    this.latitude,
    this.longitude,
    this.gallaryPhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Provider.fromRawJson(String str) => Provider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    businessName: json["business_name"],
    address: json["address"],
    description: json["description"],
    availableServiceOur: json["available_service_our"],
    coverPhoto: json["cover_photo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    gallaryPhoto: json["gallary_photo"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "business_name": businessName,
    "address": address,
    "description": description,
    "available_service_our": availableServiceOur,
    "cover_photo": coverPhoto,
    "latitude": latitude,
    "longitude": longitude,
    "gallary_photo": gallaryPhoto,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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
  dynamic googleId;
  dynamic facebookId;
  DateTime? createdAt;
  DateTime? updatedAt;
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
    this.googleId,
    this.facebookId,
    this.createdAt,
    this.updatedAt,
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
    googleId: json["google_id"],
    facebookId: json["facebook_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "google_id": googleId,
    "facebook_id": facebookId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class CatalogDetail {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  String? image;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? bookingMoney;
  String? serviceHour;
  DateTime? createdAt;
  DateTime? updatedAt;

  CatalogDetail({
    this.id,
    this.providerId,
    this.serviceId,
    this.catalogName,
    this.catalogDescription,
    this.image,
    this.serviceDuration,
    this.salonServiceCharge,
    this.homeServiceCharge,
    this.bookingMoney,
    this.serviceHour,
    this.createdAt,
    this.updatedAt,
  });

  factory CatalogDetail.fromRawJson(String str) => CatalogDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalogDetail.fromJson(Map<String, dynamic> json) => CatalogDetail(
    id: json["id"],
    providerId: json["provider_id"],
    serviceId: json["service_id"],
    catalogName: json["catalog_name"],
    catalogDescription: json["catalog_description"],
    image: json["image"],
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    bookingMoney: json["booking_money"],
    serviceHour: json["service_hour"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_id": providerId,
    "service_id": serviceId,
    "catalog_name": catalogName,
    "catalog_description": catalogDescription,
    "image": image,
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "booking_money": bookingMoney,
    "service_hour": serviceHour,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? total;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    perPage: json["per_page"],
    total: json["total"],
    nextPageUrl: json["next_page_url"],
    prevPageUrl: json["prev_page_url"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "total_pages": totalPages,
    "per_page": perPage,
    "total": total,
    "next_page_url": nextPageUrl,
    "prev_page_url": prevPageUrl,
  };
}
