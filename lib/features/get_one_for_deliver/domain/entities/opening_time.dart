import 'package:equatable/equatable.dart';

class OpeningTime extends Equatable{
  final String? open;
  final String? close;

  OpeningTime({
    required this.open,
    required this.close,
  });

  // factory HourHour.fromJson(Map<String, dynamic> json) => HourHour(
  //   open: json["open"] == null ? null : msgValues.map[json["open"]],
  //   close: json["close"] == null ? null : msgValues.map[json["close"]],
  // );

  Map<String, dynamic> toJson() => {
    "open": open == null ? null : open,
    "close": close == null ? null : close,
  };

  @override
  List<Object?> get props => [open, close];
}