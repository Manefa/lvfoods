import 'package:equatable/equatable.dart';

class AddPhone extends Equatable{
  final bool? success;
  final String? msg;

  AddPhone({
    required this.success,
    required this.msg,
  });

  // factory AddPhone.fromJson(Map<String, dynamic> json) => AddPhone(
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