import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/phone.dart';

class PhoneModel extends Phone{
  PhoneModel({
    required final String? code,
    required final String? content,
  }) : super(
    code: code,
    content: content,
  );

  factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
    code: json["code"] == null ? null : json["code"],
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "content": content == null ? null : content,
  };
}