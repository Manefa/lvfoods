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