
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/styles.dart';

class StyleModel extends Styles{

  StyleModel({
    required final String? name,
    required final String? code,
    required final String? description,
  }) : super(
    name: name,
    code: code,
    description: description,
  );

  factory StyleModel.fromJson(Map<String, dynamic> json) => StyleModel(
    name: json["name"],
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "description": description,
  };
}