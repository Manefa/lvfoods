import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/opening_time.dart';

class HourElement extends Equatable{
  final String? day;
  final OpeningTime? hour;

  HourElement({
    required this.day,
    required this.hour,
  });

  // factory HourElement.fromJson(Map<String, dynamic> json) => HourElement(
  //   day: json["day"] == null ? null : json["day"],
  //   hour: json["hour"] == null ? null : HourHour.fromJson(json["hour"]),
  // );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "hour": hour == null ? null : hour!.toJson(),
  };

  @override
  List<Object?> get props => [day, hour];
}