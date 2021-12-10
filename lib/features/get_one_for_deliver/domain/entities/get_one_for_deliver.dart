import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/delivery.dart';

class GetOneForDeliver extends Equatable{
  final bool? success;
  final String? msg;
  final Delivery? delivery;

  GetOneForDeliver({
    required this.success,
    required this.msg,
    required this.delivery,
  });

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
    "delivery": delivery == null ? null : delivery!.toJson(),
  };

  @override
  List<Object?> get props => [success, msg, delivery];
}