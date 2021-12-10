import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/opening_time.dart';

class HourElement extends Equatable{
  final String? day;
  final OpeningTime? hour;

  HourElement({
    required final this.day,
    required final this.hour,
  });

  Map<String, dynamic> toJson() => {
    "day": day,
    "hour": hour!.toJson(),
  };

  @override
  List<Object?> get props => [day, hour];
}