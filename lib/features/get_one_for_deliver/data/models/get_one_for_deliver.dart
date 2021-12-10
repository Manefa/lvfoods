import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/delivery_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/get_one_for_deliver.dart';

class GetOneForDeliverModel extends GetOneForDeliver{
  GetOneForDeliverModel({
    required final bool? success,
    required final String? msg,
    required final DeliveryModel? delivery,
  }) : super(
    success: success,
    msg: msg,
    delivery: delivery,
  );

  factory GetOneForDeliverModel.fromJson(Map<String, dynamic> json) => GetOneForDeliverModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
    delivery: json["delivery"] == null ? null : DeliveryModel.fromJson(json["delivery"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
    "delivery": delivery == null ? null : delivery!.toJson(),
  };
}