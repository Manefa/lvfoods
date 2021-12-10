import 'package:ivfoods_mobile_app/features/on_the_way/domain/entities/on_the_way.dart';

class OnTheWayModel extends OnTheWay{
  OnTheWayModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory OnTheWayModel.fromJson(Map<String, dynamic> json) => OnTheWayModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };
}