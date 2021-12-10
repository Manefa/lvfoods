import 'package:equatable/equatable.dart';

class Location extends Equatable{
  final int? latitude;
  final int? longitude;

  Location({
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
