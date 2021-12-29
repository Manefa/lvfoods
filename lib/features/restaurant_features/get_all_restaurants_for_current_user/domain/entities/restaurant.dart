import 'package:equatable/equatable.dart';

class Restaurant extends Equatable{
  final String? name;
  final String? profilePicture;
  final String? status;

  Restaurant({
    required final this.name,
    required final this.profilePicture,
    required final this.status,
  });

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "profile_picture": profilePicture == null ? null : profilePicture,
    "status": status == null ? null : status,
  };

  @override
  List<Object?> get props => [name, profilePicture, status];
}