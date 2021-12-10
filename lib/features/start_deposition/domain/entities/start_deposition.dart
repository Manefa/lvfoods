import 'package:equatable/equatable.dart';

class StartDeposition extends Equatable{
  final bool? success;
  final String? msg;

  StartDeposition({
    required final this.success,
    required final this.msg,
  });

  // factory StartDeposition.fromJson(Map<String, dynamic> json) => StartDeposition(
  //   success: json["success"],
  //   msg: json["msg"],
  // );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };

  @override
  List<Object?> get props => [success, msg];
}