import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'username')
  String userName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'address')
  UserAddress address;
  @JsonKey(name: 'phone')
  String phoneNumber;
  @JsonKey(name: 'website')
  String websiteUrl;
  @JsonKey(name: 'company')
  UserCompany userCompany;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.websiteUrl,
    required this.userCompany,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserAddress {
  @JsonKey(name: 'street')
  String streetName;
  @JsonKey(name: 'suite')
  String suite;
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'zipcode')
  String zipcode;
  @JsonKey(name: 'geo')
  String geo;

  UserAddress({
    required this.streetName,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}

@JsonSerializable()
class Geo {
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable()
class UserCompany {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'catchPhrase')
  String catchPhrase;
  @JsonKey(name: 'bs')
  String bs;

  UserCompany({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory UserCompany.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$UserCompanyToJson(this);
}
