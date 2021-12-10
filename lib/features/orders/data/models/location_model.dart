import 'package:ivfoods_mobile_app/features/orders/domain/entities/location.dart';

class LocationModel extends Location{
  LocationModel({
    required final int? latitude,
    required final int? longitude,
  }) : super(
    latitude: latitude,
    longitude: longitude,
  );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
