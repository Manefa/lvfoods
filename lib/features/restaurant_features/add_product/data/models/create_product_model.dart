import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/create_product.dart';

class CreateProductModel extends CreateProduct{

  CreateProductModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory CreateProductModel.fromJson(Map<String, dynamic> json) => CreateProductModel(
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