import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/add_phone.dart';

class AddPhoneModel extends AddPhone{

  AddPhoneModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory AddPhoneModel.fromJson(Map<String, dynamic> json) => AddPhoneModel(
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