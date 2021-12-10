import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/delivery.dart';

class DeliveriesMasters extends Equatable{
  final bool? success;
  final List<Delivery>? deliveries;
  DeliveriesMasters({
    required this.success,
    required this.deliveries,
  });

  // factory UserMaster.fromJson(Map<String, dynamic> json) => UserMaster(
  //   success: json["success"] == null ? null : json["success"],
  //   deliveries: json["deliveries"] == null ? null : List<Delivery>.from(json["deliveries"].map((x) => Delivery.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "deliveries": deliveries == null ? null : List<dynamic>.from(deliveries!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, deliveries];
}