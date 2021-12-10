import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/opening_time_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/hour_element.dart';

class HourElementModel extends HourElement{
  HourElementModel({
    required final String? day,
    required final OpeningTimeModel? hour,
  }) : super(
    day: day,
    hour: hour,
  );

  factory HourElementModel.fromJson(Map<String, dynamic> json) => HourElementModel(
    day: json["day"],
    hour: OpeningTimeModel.fromJson(json["hour"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "hour": hour!.toJson(),
  };
}