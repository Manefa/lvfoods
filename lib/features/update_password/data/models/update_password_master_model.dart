import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';

class UpdatePasswordMasterModel extends UpdatePasswordMaster{
  UpdatePasswordMasterModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory UpdatePasswordMasterModel.fromJson(Map<String, dynamic> json) => UpdatePasswordMasterModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };
}