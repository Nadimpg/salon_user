import 'dart:convert';

class CatalougeDetailsModel {
  String? message;
  int? review;
  int? rating;
  CatalougDetails? catalougDetails;

  CatalougeDetailsModel({
    this.message,
    this.review,
    this.rating,
    this.catalougDetails,
  });

  factory CatalougeDetailsModel.fromRawJson(String str) => CatalougeDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalougeDetailsModel.fromJson(Map<String, dynamic> json) => CatalougeDetailsModel(
    message: json["message"],
    review: json["review"],
    rating: json["rating"],
    catalougDetails: json["cataloug_details"] == null ? null : CatalougDetails.fromJson(json["cataloug_details"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "review": review,
    "rating": rating,
    "cataloug_details": catalougDetails?.toJson(),
  };
}

class CatalougDetails {
  int? id;
  int? providerId;
  int? serviceId;
  String? catalogName;
  String? catalogDescription;
  List<String>? image;
  String? serviceDuration;
  String? salonServiceCharge;
  String? homeServiceCharge;
  String? bookingMoney;
  List<ServiceHour>? serviceHour;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? serviceRating;

  CatalougDetails({
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
    this.serviceRating,
  });

  factory CatalougDetails.fromRawJson(String str) => CatalougDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalougDetails.fromJson(Map<String, dynamic> json) => CatalougDetails(
    id: json["id"],
    providerId: json["provider_id"],
    serviceId: json["service_id"],
    catalogName: json["catalog_name"],
    catalogDescription: json["catalog_description"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    serviceDuration: json["service_duration"],
    salonServiceCharge: json["salon_service_charge"],
    homeServiceCharge: json["home_service_charge"],
    bookingMoney: json["booking_money"],
    serviceHour: json["service_hour"] == null ? [] : List<ServiceHour>.from(json["service_hour"]!.map((x) => ServiceHour.fromJson(x))),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    serviceRating: json["service_rating"] == null ? [] : List<dynamic>.from(json["service_rating"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_id": providerId,
    "service_id": serviceId,
    "catalog_name": catalogName,
    "catalog_description": catalogDescription,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "service_duration": serviceDuration,
    "salon_service_charge": salonServiceCharge,
    "home_service_charge": homeServiceCharge,
    "booking_money": bookingMoney,
    "service_hour": serviceHour == null ? [] : List<dynamic>.from(serviceHour!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "service_rating": serviceRating == null ? [] : List<dynamic>.from(serviceRating!.map((x) => x)),
  };
}

/*class ServiceHour {
  String? day;
  Time? startTime;
  Time? endTime;

  ServiceHour({
    this.day,
    this.startTime,
    this.endTime,
  });

  factory ServiceHour.fromRawJson(String str) => ServiceHour.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceHour.fromJson(Map<String, dynamic> json) => ServiceHour(
    day: json["Day"],
    startTime: timeValues.map[json["Start Time"]]!,
    endTime: timeValues.map[json["End Time"]]!,
  );

  Map<String, dynamic> toJson() => {
    "Day": day,
    "Start Time": timeValues.reverse[startTime],
    "End Time": timeValues.reverse[endTime],
  };
}*/
class ServiceHour {
  String? day;
  String? startTime;
  String? endTime;

  ServiceHour({this.day, this.startTime, this.endTime});

  ServiceHour.fromJson(Map<String, dynamic> json) {
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
