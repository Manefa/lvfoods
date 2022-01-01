import 'package:equatable/equatable.dart';

class ForAddHours extends Equatable{
  final String? day;
  final String? open;
  final String? close;

  ForAddHours({
    required this.day,
    required this.open,
    required this.close,
  });

  factory ForAddHours.fromJson(Map<String, dynamic> json) => ForAddHours(
    day: json["day"] == null ? null : json["day"],
    open: json["open"] == null ? null : json["open"],
    close: json["close"] == null ? null : json["close"],
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "open": open == null ? null : open,
    "close": close == null ? null : close,
  };

  @override
  List<Object?> get props => [day, open, close];
}
