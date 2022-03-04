import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city.dart';

class CityMaster extends Equatable{
  final bool? success;
  final List<City>? cities;

  CityMaster({
    required this.success,
    required this.cities,
  });

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "cities": cities == null ? null : List<dynamic>.from(cities!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, cities];
}