import 'package:equatable/equatable.dart';

class DeliveriesRequests extends Equatable{
  final String? user;
  final String? code;
  final String? status;
  final String? id;

  DeliveriesRequests({
    required final this.user,
    required final this.code,
    required final this.status,
    required final this.id,
    });


  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "status": status,
    "_id": id,
  };

  @override
  List<Object?> get props => [user, code, status, id];
}
