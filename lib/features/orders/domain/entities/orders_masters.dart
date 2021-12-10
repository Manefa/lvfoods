import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovery.dart';

class OrdersMasters extends Equatable{
  final bool? success;
  final List<Recovery>? recoveries;

  OrdersMasters({
    required final this.success,
    required final this.recoveries,
  });

  Map<String, dynamic> toJson() => {
    "success": success,
    "recoveries": List<dynamic>.from(recoveries!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, recoveries];
}