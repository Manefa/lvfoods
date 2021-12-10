import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';

class TakeDeliveryMasterModel extends TakeDeliveryMaster{
  TakeDeliveryMasterModel({
    required final bool? success,
    required final String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory TakeDeliveryMasterModel.fromJson(Map<String, dynamic> json) => TakeDeliveryMasterModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };
}
