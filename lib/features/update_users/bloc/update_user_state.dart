
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';

abstract class UpdateUserState extends Equatable {
  const UpdateUserState();
}

class EmptyUpdateUser extends UpdateUserState {
  @override
  List<Object> get props => [];
}

class LoadingUpdateUser extends UpdateUserState {
  @override
  List<Object> get props => [];
}

class LoadedUpdateUser extends UpdateUserState {
  final UserMaster userMaster;

  LoadedUpdateUser({required this.userMaster});
  @override
  List<Object> get props => [];
}

class ErrorUpdateUser extends UpdateUserState {
  final String message;

  ErrorUpdateUser({required this.message});
  @override
  List<Object> get props => [];
}
