import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? username;
  final String? fullName;
  final String? email;

  User({
    required final this.username,
    required final this.fullName,
    required final this.email,
  });

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "full_name": fullName == null ? null : fullName,
    "email": email == null ? null : email,
  };

  @override
  List<Object?> get props => [username, fullName, email];
}
