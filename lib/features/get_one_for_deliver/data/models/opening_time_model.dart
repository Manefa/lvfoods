import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/opening_time.dart';

class OpeningTimeModel extends OpeningTime{
  OpeningTimeModel({
    required final String? open,
    required final String? close,
  }) : super(
    open: open,
    close: close,
  );

  factory OpeningTimeModel.fromJson(Map<String, dynamic> json) => OpeningTimeModel(
    open: json["open"] == null ? null : json["open"],
    close: json["close"] == null ? null : json["close"],
  );

  Map<String, dynamic> toJson() => {
    "open": open == null ? null : open,
    "close": close == null ? null : close,
  };
}