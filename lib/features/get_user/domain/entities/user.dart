import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/phone.dart';

class User extends Equatable{
  final String? username;
  final String? code;
  final String? fullName;
  final String? email;
  final String? picture;
  final String? password;
  final String? role;
  final List<Phone>? phones;

  User({
    required final this.username,
    required final this.code,
    required final this.fullName,
    required final this.email,
    required final this.picture,
    required final this.password,
    required final this.role,
    required final this.phones,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "code": code,
    "full_name": fullName,
    "email": email,
    "picture": picture,
    "password": password,
    "role": role,
    "phones": List<dynamic>.from(phones!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [username, code, fullName, email, picture, password, role, phones, ];
}