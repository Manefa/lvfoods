import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/location.dart';

class LocationModel extends Location{

  LocationModel({
    required final double? latitude,
    required final double? longitude,
  }) : super(
    latitude: latitude,
    longitude: longitude,
  );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    latitude: json["latitude"] == null ? null : (json["latitude"] as num).toDouble(),
    longitude: json["longitude"] == null ? null : (json["longitude"] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}