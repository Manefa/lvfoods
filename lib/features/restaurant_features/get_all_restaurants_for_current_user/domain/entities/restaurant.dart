import 'package:equatable/equatable.dart';

class Restaurant extends Equatable{
  final String? name;
  final String? profilePicture;
  final String? status;
  final String? address;

  Restaurant({
    required final this.name,
    required final this.profilePicture,
    required final this.status,
    required final this.address,
  });

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "profile_picture": profilePicture == null ? null : profilePicture,
    "status": status == null ? null : status,
    "address": address == null ? null : address,
  };

  @override
  List<Object?> get props => [name, profilePicture, status, address];
}