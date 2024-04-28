import 'dart:convert';

class IndividualDetailsModel {
  String? message;
  int? review;
  int? rating;
  ServiceDetails? serviceDetails;

  IndividualDetailsModel({
    this.message,
    this.review,
    this.rating,
    this.serviceDetails,
  });

  factory IndividualDetailsModel.fromRawJson(String str) => IndividualDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndividualDetailsModel.fromJson(Map<String, dynamic> json) => IndividualDetailsModel(
    message: json["message"],
    review: json["review"],
    rating: json["rating"],
    serviceDetails: json["service_details"] == null ? null : ServiceDetails.fromJson(json["service_details"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "review": review,
    "rating": rating,
    "service_details": serviceDetails?.toJson(),
  };
}

class ServiceDetails {
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
  List<ServiceRating>? serviceRating;

  ServiceDetails({
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

  factory ServiceDetails.fromRawJson(String str) => ServiceDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
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
    serviceRating: json["service_rating"] == null ? [] : List<ServiceRating>.from(json["service_rating"]!.map((x) => ServiceRating.fromJson(x))),
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
    "service_rating": serviceRating == null ? [] : List<dynamic>.from(serviceRating!.map((x) => x.toJson())),
  };
}

// class AvailableServiceOur {
//   String? day;
//   Time? startTime;
//   Time? endTime;
//
//   AvailableServiceOur({
//     this.day,
//     this.startTime,
//     this.endTime,
//   });
//
//   factory AvailableServiceOur.fromRawJson(String str) => AvailableServiceOur.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory AvailableServiceOur.fromJson(Map<String, dynamic> json) => AvailableServiceOur(
//     day: json["Day"],
//     startTime: timeValues.map[json["Start Time"]]!,
//     endTime: timeValues.map[json["End Time"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Day": day,
//     "Start Time": timeValues.reverse[startTime],
//     "End Time": timeValues.reverse[endTime],
//   };
// }
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

class ServiceRating {
  int? id;
  int? userId;
  String? userName;
  String? userImage;
  String? review;
  int? rating;

  ServiceRating({
    this.id,
    this.userId,
    this.userName,
    this.userImage,
    this.review,
    this.rating,
  });

  factory ServiceRating.fromRawJson(String str) => ServiceRating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceRating.fromJson(Map<String, dynamic> json) => ServiceRating(
    id: json["id"],
    userId: json["user_id"],
    userName: json["user_name"],
    userImage: json["user_image"],
    review: json["review"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_name": userName,
    "user_image": userImage,
    "review": review,
    "rating": rating,
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
