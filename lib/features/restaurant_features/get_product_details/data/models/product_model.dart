import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/models/category_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/models/notice_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    required String? name,
    required String? description,
    required String? picture,
    required String? code,
    required double? price,
    required double? note,
    required double? discount,
    required List<NoticeModel>? notices,
    required List<CategoryModel>? categories,
    required String? status,
  }) : super(
    name: name,
    description: description,
    picture: picture,
    code: code,
    price: price,
    note: note,
    discount: discount,
    notices: notices,
    categories: categories,
    status: status,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    picture: json["picture"] == null ? null : json["picture"],
    code: json["code"] == null ? null : json["code"],
    price: json["price"] == null ? null : (json["price"] as num).toDouble(),
    note: json["note"] == null ? null : (json["note"] as num).toDouble(),
    discount: json["discount"] == null ? null : (json["discount"] as num).toDouble(),
    notices: json["notices"] == null ? null : List<NoticeModel>.from(json["notices"].map((x) => NoticeModel.fromJson(x))),
    categories: json["categories"] == null ? null : List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "picture": picture == null ? null : picture,
    "code": code == null ? null : code,
    "price": price == null ? null : price,
    "note": note == null ? null : note,
    "discount": discount == null ? null : discount,
    "notices": notices == null ? null : List<dynamic>.from(notices!.map((x) => x.toJson())),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "status": status == null ? null : status,
  };

}