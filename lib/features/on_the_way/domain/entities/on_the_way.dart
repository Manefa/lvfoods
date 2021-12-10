import 'package:equatable/equatable.dart';

class OnTheWay extends Equatable{
  final bool? success;
  final String? msg;

  OnTheWay({
    required this.success,
    required this.msg,
  });

  // factory OnTheWay.fromJson(Map<String, dynamic> json) => OnTheWay(
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