import 'dart:io';

import 'package:equatable/equatable.dart';

class UserForUpdate extends Equatable{
  final String? username;
  final String? fullName;
  final String? email;
  final File? image;

  UserForUpdate({
     final this.username,
     final this.fullName,
     final this.email,
    final this.image,
  });


  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "full_name": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "image": image == null ? null : image,
  };

  @override
  List<Object?> get props => [username, fullName, email, image];
}