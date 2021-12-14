import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? username;
  final String? fullName;
  final String? email;
  final String? image;

  User({
    required final this.username,
    required final this.fullName,
    required final this.email,
    required final this.image,
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
