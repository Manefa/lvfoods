import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';

class OrderGroupPaidModel extends OrderGroupPaid{
  OrderGroupPaidModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory OrderGroupPaidModel.fromJson(Map<String, dynamic> json) => OrderGroupPaidModel(
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