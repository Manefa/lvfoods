import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user_master.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();
}

class EmptyUser extends GetUserState {
  @override
  List<Object> get props => [];
}

class LoadingUser extends GetUserState{
  @override
  List<Object?> get props => [];
}

class LoadedUser extends GetUserState{
  final UserMaster userMaster;

  LoadedUser({required this.userMaster});
  @override
  List<Object?> get props => [userMaster];
}

class ErrorUser extends GetUserState{
  final String message;

  ErrorUser({required this.message});
  @override
  List<Object?> get props => [message];
}