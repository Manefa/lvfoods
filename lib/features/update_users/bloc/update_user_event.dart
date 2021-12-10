import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';

abstract class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();
}

class UpdateUser extends UpdateUserEvent{
  final UserForUpdate userForUpdate;

  UpdateUser({required this.userForUpdate});

  @override
  List<Object?> get props => [];
}
