
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';

class StyleModel extends Style{
  StyleModel({
    required String? id,
    required String? name,
  }) : super(
    id: id,
    name: name,
  );

  factory StyleModel.fromJson(Map<String, dynamic> json) => StyleModel(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}