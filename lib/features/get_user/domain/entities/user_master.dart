import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user.dart';

class UserMaster extends Equatable{
  final bool? success;
  final User? users;

  UserMaster({
    required final this.success,
    required final this.users,
  });

  Map<String, dynamic> toJson() => {
    "success": success,
    "users": users!.toJson(),
  };

  @override
  List<Object?> get props => [success, users];
}