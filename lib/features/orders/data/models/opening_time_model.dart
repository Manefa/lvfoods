import 'package:ivfoods_mobile_app/features/orders/domain/entities/opening_time.dart';

class OpeningTimeModel extends OpeningTime{
  OpeningTimeModel({
    required final String? open,
    required final String? close,
  }) : super(
    open: open,
    close: close,
  );

  factory OpeningTimeModel.fromJson(Map<String, dynamic> json) => OpeningTimeModel(
    open: json["open"],
    close: json["close"],
  );

  Map<String, dynamic> toJson() => {
    "open": open,
    "close": close,
  };
}