import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';

class StartDepositionModel extends StartDeposition{
  StartDepositionModel({
    required final bool? success,
    required final String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory StartDepositionModel.fromJson(Map<String, dynamic> json) => StartDepositionModel(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}