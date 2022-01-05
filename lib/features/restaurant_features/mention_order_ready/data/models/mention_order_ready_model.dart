
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/entities/mention_order_ready.dart';

class MentionOrderReadyModel extends MentionOrderReady{
  MentionOrderReadyModel({
    required final bool? success,
    required final String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory MentionOrderReadyModel.fromJson(Map<String, dynamic> json) => MentionOrderReadyModel(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}