import 'package:equatable/equatable.dart';

class CreateProduct extends Equatable{
  final bool? success;
  final String? msg;

  CreateProduct({
    required this.success,
    required this.msg,
  });

  // factory UpdateProduct.fromJson(Map<String, dynamic> json) => UpdateProduct(
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