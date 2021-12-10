import 'package:equatable/equatable.dart';

class DeliveriesRequest extends Equatable{
  final String? user;
  final String? code;
  final String? status;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  DeliveriesRequest({
    required this.user,
    required this.code,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory DeliveriesRequest.fromJson(Map<String, dynamic> json) => DeliveriesRequest(
  //   user: json["user"] == null ? null : msgValues.map[json["user"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   status: json["status"] == null ? null : json["status"],
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user,
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };

  @override
  List<Object?> get props => [user, code, status, id, createdAt, updatedAt];
}