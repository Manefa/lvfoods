import 'package:equatable/equatable.dart';

class SendPassword extends Equatable{
  final String? lastPassword;
  final String? newPassword;

  SendPassword({
    required this.lastPassword,
    required this.newPassword,
  });

  // factory SendPassword.fromJson(Map<String, dynamic> json) => SendPassword(
  //   lastPassword: json["last_password"] == null ? null : json["last_password"],
  //   newPassword: json["new_password"] == null ? null : json["new_password"],
  // );

  Map<String, dynamic> toJson() => {
    "last_password": lastPassword == null ? null : lastPassword,
    "new_password": newPassword == null ? null : newPassword,
  };

  @override
  List<Object?> get props => [lastPassword, newPassword];
}