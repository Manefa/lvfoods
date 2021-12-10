import 'package:equatable/equatable.dart';

class DeliveriesEmplacements extends Equatable{
  final String? user;
  final String? code;
  final String? address;
  final String? id;

  DeliveriesEmplacements({
    required final this.user,
    required final this.code,
    required final this.address,
    required final this.id,
    });


  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "address": address,
    "_id": id,
  };

  @override
  List<Object?> get props => [user, code, address, id];
}
