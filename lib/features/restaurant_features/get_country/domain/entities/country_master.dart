import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country.dart';

class CountryMaster extends Equatable{
  final bool? success;
  final List<Country>? countries;

  CountryMaster({
    required this.success,
    required this.countries,
  });

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "countries": countries == null ? null : List<dynamic>.from(countries!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, countries];
}