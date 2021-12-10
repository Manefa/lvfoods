import 'package:equatable/equatable.dart';

class TakeDeliveryMaster extends Equatable{
  final bool? success;
  final String? msg;

  TakeDeliveryMaster({
    required final this.success,
    required final this.msg,
  });

  // factory GetOneForDeliver.fromJson(Map<String, dynamic> json) => GetOneForDeliver(
  //   success: json["success"] == null ? null : json["success"],
  //   msg: json["msg"] == null ? null : json["msg"],
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}
