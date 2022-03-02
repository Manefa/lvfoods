import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/country.dart';

class City extends Equatable{

  final String? name;
  final String? code;
  final String? country;
  final String? id;

  City({
    required this.name,
    required this.code,
    required this.country,
    required this.id,
  });


  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "country": country == null ? null : country,
    "_id": id == null ? null : id,
  };

  @override
  List<Object?> get props => [name, code, country, id];
}
