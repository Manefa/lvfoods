import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country.dart';

class CountryModel extends Country{

  CountryModel({
    required String? name,
    required String? code,
    required bool? status,
    required String? id,
  }) : super(
    name: name,
    code: code,
    status: status,
    id: id,
  );

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
  };

  @override
  List<Object?> get props => [name, code, status, id];
}
