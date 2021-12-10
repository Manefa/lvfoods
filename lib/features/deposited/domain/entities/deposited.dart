import 'package:equatable/equatable.dart';

class Deposited extends Equatable{
  final bool? success;
  final String? msg;
  Deposited({
    required final this.success,
    required final this.msg,
  });

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };

  @override
  List<Object?> get props => [success, msg];
}