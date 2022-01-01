
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/entities/remove_hours.dart';

class RemoveHoursModel extends RemoveHours{

  RemoveHoursModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory RemoveHoursModel.fromJson(Map<String, dynamic> json) => RemoveHoursModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}