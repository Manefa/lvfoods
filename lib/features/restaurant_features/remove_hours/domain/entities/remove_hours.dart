import 'package:equatable/equatable.dart';

class RemoveHours extends Equatable{
  final bool? success;
  final String? msg;

  RemoveHours({
    required this.success,
    required this.msg,
  });

  // factory RemoveHours.fromJson(Map<String, dynamic> json) => RemoveHours(
  //   success: json["success"] == null ? null : json["success"],
  //   msg: json["msg"] == null ? null : json["msg"],
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}