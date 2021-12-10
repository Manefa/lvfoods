
import 'package:ivfoods_mobile_app/features/delivered/domain/entities/location.dart';

class LocationModel extends Location{
  LocationModel({
    required double? latitude,
    required double? longitude,
  }) : super(
    latitude: latitude,
    longitude: longitude,
  );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}