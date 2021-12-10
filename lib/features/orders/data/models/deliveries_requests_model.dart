import 'package:ivfoods_mobile_app/features/orders/domain/entities/deliveries_requests.dart';

class DeliveriesRequestsModel extends DeliveriesRequests{
  DeliveriesRequestsModel({
    required final String? user,
    required final String? code,
    required final String? status,
    required final String? id,
  }) : super(
    user: user,
    code: code,
    status: status,
    id: id,
  );

  factory DeliveriesRequestsModel.fromJson(Map<String, dynamic> json) => DeliveriesRequestsModel(
    user: json["user"],
    code: json["code"],
    status: json["status"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "status": status,
    "_id": id,
  };
}
