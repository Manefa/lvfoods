import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/update_product.dart';

class UpdateProductModel extends UpdateProduct{
  UpdateProductModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );

  factory UpdateProductModel.fromJson(Map<String, dynamic> json) => UpdateProductModel(
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