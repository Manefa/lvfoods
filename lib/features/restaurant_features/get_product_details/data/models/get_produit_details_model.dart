

import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';

class GetProductDetailsModel extends GetProductDetails{

  GetProductDetailsModel({
    required bool? success,
    required String? msg,
    required ProductModel? product,
  }) : super(
    success: success,
    msg: msg,
    product: product,
  );

  factory GetProductDetailsModel.fromJson(Map<String, dynamic> json) => GetProductDetailsModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
    product: json["product"] == null ? null : ProductModel.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
    "product": product == null ? null : product!.toJson(),
  };

  @override
  List<Object?> get props => [success, msg, product];
}