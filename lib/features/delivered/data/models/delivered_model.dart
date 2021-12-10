import 'package:ivfoods_mobile_app/features/delivered/domain/entities/delivered.dart';

class DeliveredModel extends Delivered{
  DeliveredModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory DeliveredModel.fromJson(Map<String, dynamic> json) => DeliveredModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };
}