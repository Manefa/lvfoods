import 'package:equatable/equatable.dart';

class MentionOrderReady extends Equatable{
  final bool? success;
  final String? msg;

  MentionOrderReady({
    required final this.success,
    required final this.msg,
  });

  // factory StartRecovery.fromJson(Map<String, dynamic> json) => StartRecovery(
  //   success: json["success"],
  //   msg: json["msg"],
  // );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };

  @override
  List<Object?> get props => [success, msg];
}