import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/entities/remove_phone.dart';

class RemovePhoneModel extends RemovePhone{

  RemovePhoneModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory RemovePhoneModel.fromJson(Map<String, dynamic> json) => RemovePhoneModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}