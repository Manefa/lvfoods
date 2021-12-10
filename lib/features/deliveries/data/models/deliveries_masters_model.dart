import 'package:ivfoods_mobile_app/features/deliveries/data/models/delivery_model.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';

class DeliveriesMastersModel extends DeliveriesMasters{
  DeliveriesMastersModel({
    required bool success,
    required List<DeliveryModel>? deliveries,
  }) : super(
    success: success,
    deliveries: deliveries,
  );

  factory DeliveriesMastersModel.fromJson(Map<String, dynamic> json) => DeliveriesMastersModel(
    success: json["success"] == null ? null : json["success"],
    deliveries: json["deliveries"] == null ? null : List<DeliveryModel>.from(json["deliveries"].map((x) => DeliveryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "deliveries": deliveries == null ? null : List<dynamic>.from(deliveries!.map((x) => x.toJson())),
  };
}