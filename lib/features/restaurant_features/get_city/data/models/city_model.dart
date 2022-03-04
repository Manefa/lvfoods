import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/data/models/country_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city.dart';

class CityModel extends City{

  CityModel({
    required String? name,
    required String? code,
    required String? country,
    required String? id,
  }) : super(
    name: name,
    code: code,
    country: country,
    id: id,
  );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    country: json["country"] == null ? null : json["country"],
    id: json["_id"] == null ? null : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "country": country == null ? null : country,
    "_id": id == null ? null : id,
  };

  @override
  List<Object?> get props => [name, code, country, id];
}
