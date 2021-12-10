import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/phone.dart';

class PhoneModel extends Phone{
  PhoneModel({
    required final String? code,
    required final String? content,
  }) : super(
    code: code,
    content: content,
  );

  factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
    code: json["code"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "content": content,
  };
}