import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/deliveries.dart';

class DeliveriesModel extends Deliveries{
  DeliveriesModel({
    required final String? user,
    required final String? code,
    required final String? address,
    required final String? id,
    required final String? status,
  }) : super(
    user: user,
    code: code,
    address: address,
    id: id,
    status: status,
  );

  factory DeliveriesModel.fromJson(Map<String, dynamic> json) => DeliveriesModel(
    user: json["user"],
    code: json["code"],
    address: json["address"],
    id: json["_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "address": address,
    "_id": id,
    "status": status,
  };
}