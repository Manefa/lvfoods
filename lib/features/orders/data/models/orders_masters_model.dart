import 'package:ivfoods_mobile_app/features/orders/data/models/recovery_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/orders_masters.dart';

class OrdersMastersModel extends OrdersMasters{
  OrdersMastersModel({
    required final bool? success,
    required final List<RecoveryModel>? recoveries,
  }) : super(
    success: success,
    recoveries: recoveries,
  );

  factory OrdersMastersModel.fromJson(Map<String, dynamic> json) => OrdersMastersModel(
    success: json["success"],
    recoveries: List<RecoveryModel>.from(json["recoveries"].map((x) => RecoveryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "recoveries": List<dynamic>.from(recoveries!.map((x) => x.toJson())),
  };
}