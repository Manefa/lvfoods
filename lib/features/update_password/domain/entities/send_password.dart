import 'package:equatable/equatable.dart';

class SendPassword extends Equatable{
  final String? lastPassword;
  final String? newPassword;
  final String? confirmPassword;

  SendPassword({
    required this.lastPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  // factory SendPassword.fromJson(Map<String, dynamic> json) => SendPassword(
  //   lastPassword: json["last_password"] == null ? null : json["last_password"],
  //   newPassword: json["new_password"] == null ? null : json["new_password"],
  // );

  Map<String, dynamic> toJson() => {
    "last_password": lastPassword == null ? null : lastPassword,
    "new_password": newPassword == null ? null : newPassword,
    "confirm_password": confirmPassword == null ? null : confirmPassword,
  };

  @override
  List<Object?> get props => [lastPassword, newPassword, confirmPassword];
}