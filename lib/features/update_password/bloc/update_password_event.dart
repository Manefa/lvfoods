import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/send_password.dart';

abstract class UpdatePasswordEvent extends Equatable {
  const UpdatePasswordEvent();
}

class LaunchUpdatePassword extends UpdatePasswordEvent{
  final SendPassword sendPassword;

  LaunchUpdatePassword({required this.sendPassword});

  @override
  List<Object?> get props => [sendPassword];
}
