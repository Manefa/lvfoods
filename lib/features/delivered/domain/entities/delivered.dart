import 'package:equatable/equatable.dart';

class Delivered extends Equatable{
  final bool? success;
  final String? msg;

  Delivered({
    required this.success,
    required this.msg,
  });

  // factory Delivered.fromJson(Map<String, dynamic> json) => Delivered(
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