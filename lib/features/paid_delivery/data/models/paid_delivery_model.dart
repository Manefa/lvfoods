import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';

class PaidDeliveryMasterModel extends PaidDeliveryMaster{

  PaidDeliveryMasterModel({
    required final bool? success,
    required final String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory PaidDeliveryMasterModel.fromJson(Map<String, dynamic> json) => PaidDeliveryMasterModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };
}