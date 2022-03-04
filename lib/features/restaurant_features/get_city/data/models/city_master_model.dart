
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/data/models/city_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city_master.dart';

class CityMasterModel extends CityMaster{
  CityMasterModel({
    required bool? success,
    required List<CityModel>? cities,
  }) : super(
    success: success,
    cities: cities
  );

  factory CityMasterModel.fromJson(Map<String, dynamic> json) => CityMasterModel(
    success: json["success"] == null ? null : json["success"],
    cities: json["cities"] == null ? null : List<CityModel>.from(json["cities"].map((x) => CityModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "cities": cities == null ? null : List<dynamic>.from(cities!.map((x) => x.toJson())),
  };

}