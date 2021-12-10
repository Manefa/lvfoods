import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';

class StartRecoveryModel extends StartRecovery{
  StartRecoveryModel({
    required final bool? success,
    required final String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory StartRecoveryModel.fromJson(Map<String, dynamic> json) => StartRecoveryModel(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}