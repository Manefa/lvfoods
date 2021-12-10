import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/deliveries_request.dart';

class DeliveriesRequestModel extends DeliveriesRequest{
  DeliveriesRequestModel({
    required final String? user,
    required final String? code,
    required final String? status,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    user: user,
    code: code,
    status: status,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory DeliveriesRequestModel.fromJson(Map<String, dynamic> json) => DeliveriesRequestModel(
    user: json["user"] == null ? null : json["user"],
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user,
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}