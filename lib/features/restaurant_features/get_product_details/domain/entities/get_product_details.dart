import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/product.dart';

class GetProductDetails extends Equatable{
  final bool? success;
  final String? msg;
  final Product? product;

  GetProductDetails({
    required this.success,
    required this.msg,
    required this.product,
  });

  // factory GetProductDetails.fromJson(Map<String, dynamic> json) => GetProductDetails(
  //   success: json["success"] == null ? null : json["success"],
  //   msg: json["msg"] == null ? null : msgValues.map[json["msg"]],
  //   product: json["product"] == null ? null : Product.fromJson(json["product"]),
  // );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
    "product": product == null ? null : product!.toJson(),
  };

  @override
  List<Object?> get props => [success, msg, product];
}