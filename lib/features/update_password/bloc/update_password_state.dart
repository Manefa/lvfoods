import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';

abstract class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();
}

class UpdatePasswordEmpty extends UpdatePasswordState {
  @override
  List<Object> get props => [];
}

class UpdatePasswordLoading extends UpdatePasswordState {
  @override
  List<Object> get props => [];
}

class UpdatePasswordLoaded extends UpdatePasswordState {
  final UpdatePasswordMaster updatePasswordMaster;

  UpdatePasswordLoaded({required this.updatePasswordMaster});
  @override
  List<Object> get props => [updatePasswordMaster];
}

class UpdatePasswordError extends UpdatePasswordState {
  final String message;

  UpdatePasswordError({required this.message});

  @override
  List<Object> get props => [message];
}

