import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/data/models/country_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country_master.dart';

class CountryMasterModel extends CountryMaster{
  CountryMasterModel({
    required bool? success,
    required List<CountryModel>? countries,
  }) : super(
    success: success,
    countries: countries,
  );

  factory CountryMasterModel.fromJson(Map<String, dynamic> json) => CountryMasterModel(
    success: json["success"] == null ? null : json["success"],
    countries: json["countries"] == null ? null : List<CountryModel>.from(json["countries"].map((x) => CountryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "countries": countries == null ? null : List<dynamic>.from(countries!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, countries];
}
