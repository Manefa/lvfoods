import 'package:ivfoods_mobile_app/features/orders/domain/entities/geographic_coordinates.dart';

class GeographicCoordinatesModel extends GeographicCoordinates{
  GeographicCoordinatesModel({
    required final double? latitude,
    required final double? longitude,
  }) : super(
    latitude: latitude,
    longitude: longitude,
  );

  factory GeographicCoordinatesModel.fromJson(Map<String, dynamic> json) => GeographicCoordinatesModel(
    latitude: (json["latitude"]).toDouble(),
    longitude: (json["longitude"]).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}