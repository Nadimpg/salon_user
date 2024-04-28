import 'dart:convert';

class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? image;
  String? latitude;
  String? longitude;
  dynamic phoneNumber;
  dynamic address;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.latitude,
    this.longitude,
    this.phoneNumber,
    this.address,
  });

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    phoneNumber: json["phone_number"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name ?? "",
    "email": email ?? "",
    "image": image ??
        "https://img.freepik.com/free-photo/user-sign-icon-front-side-with-white-background_187299-40022.jpg?w=740&t=st=1705481431~exp=1705482031~hmac=89e2b2de749a608d27e73991f06a1e449c6e4ab8f8e9c74465b18ec415db010f",
    "latitude": latitude ?? "",
    "longitude": longitude ?? "",
    "phone_number": phoneNumber ?? "",
    "address": address ?? "",
  };
}