import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/deliveries_emplacements.dart';

class DeliveriesEmplacementsModel extends DeliveriesEmplacements{
  DeliveriesEmplacementsModel({
    required final String? user,
    required final String? code,
    required final String? address,
    required final String? id,
  }) : super(
    user: user,
    code: code,
    address: address,
    id: id
  );

  factory DeliveriesEmplacementsModel.fromJson(Map<String, dynamic> json) => DeliveriesEmplacementsModel(
    user: json["user"],
    code: json["code"],
    address: json["address"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "address": address,
    "_id": id,
  };
}
