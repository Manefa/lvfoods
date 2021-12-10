import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';


class UserMasterModel extends UserMaster{
  UserMasterModel({
    required bool success,
  }) : super(
    success: success,
  );

  factory UserMasterModel.fromJson(Map<String, dynamic> json) => UserMasterModel(
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
  };
}