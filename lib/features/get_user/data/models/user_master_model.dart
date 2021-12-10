import 'package:ivfoods_mobile_app/features/get_user/data/models/user_model.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user_master.dart';

class UserMasterModel extends UserMaster{
  UserMasterModel({
    required final bool? success,
    required final UserModel? users,
  }) : super(
    success: success,
    users: users,
  );

  factory UserMasterModel.fromJson(Map<String, dynamic> json) => UserMasterModel(
    success: json["success"],
    users: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "users": users == null ? null : users!.toJson(),
  };
}