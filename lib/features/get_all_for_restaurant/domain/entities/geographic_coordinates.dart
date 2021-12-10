import 'package:equatable/equatable.dart';

class GeographicCoordinates extends Equatable{
  final double? latitude;
  final double? longitude;

  GeographicCoordinates({
    required final this.latitude,
    required final this.longitude,
  });

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };

  @override
  List<Object?> get props => [latitude, longitude];
}