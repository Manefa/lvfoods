import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';

class DepositedModel extends Deposited{

  DepositedModel({
    required final bool? success,
    required final String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory DepositedModel.fromJson(Map<String, dynamic> json) => DepositedModel(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}