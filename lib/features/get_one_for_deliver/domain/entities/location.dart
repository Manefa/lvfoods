import 'package:equatable/equatable.dart';

class Location extends Equatable{
  final double? latitude;
  final double? longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  // factory Location.fromJson(Map<String, dynamic> json) => Location(
  //   latitude: json["latitude"] == null ? null : json["latitude"],
  //   longitude: json["longitude"] == null ? null : json["longitude"],
  // );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };

  @override
  List<Object?> get props => [latitude, longitude];
}