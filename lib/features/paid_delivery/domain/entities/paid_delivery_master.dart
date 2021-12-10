import 'package:equatable/equatable.dart';

class PaidDeliveryMaster extends Equatable{
  final bool? success;
  final String? msg;

  PaidDeliveryMaster({
    required final this.success,
    required final this.msg,
  });

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}