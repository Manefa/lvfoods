import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/opening_time_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/hour_element.dart';

class HourElementModel extends HourElement{

  HourElementModel({
    required final String? day,
    required final OpeningTimeModel? hour,
  }) : super(
    day: day,
    hour: hour,
  );

  factory HourElementModel.fromJson(Map<String, dynamic> json) => HourElementModel(
    day: json["day"] == null ? null : json["day"],
    hour: json["hour"] == null ? null : OpeningTimeModel.fromJson(json["hour"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "hour": hour == null ? null : hour!.toJson(),
  };
}