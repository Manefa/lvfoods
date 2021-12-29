import 'package:equatable/equatable.dart';

class ProductDeleteMaster extends Equatable{
  final bool? success;
  final String? msg;

  ProductDeleteMaster({
    required this.success,
    required this.msg,
  });


  // factory ProductDeleteMaster.fromJson(Map<String, dynamic> json) => ProductDeleteMaster(
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