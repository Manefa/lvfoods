import 'package:equatable/equatable.dart';

class Deliveries extends Equatable{
  final String? user;
  final String? code;
  final String? address;
  final String? id;
  final String? status;

  Deliveries({
    required final this.user,
    required final this.code,
    required final this.address,
    required final this.id,
    required final this.status,
  });

  factory Deliveries.fromJson(Map<String, dynamic> json) => Deliveries(
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

  @override
  List<Object?> get props => [user, code, address, id, status];
}