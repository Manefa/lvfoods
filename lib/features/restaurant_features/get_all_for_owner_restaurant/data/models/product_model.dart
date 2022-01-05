import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/product.dart';

class ProductModel extends Product{

  ProductModel({
    required String? name,
    required String? description,
    required String? picture,
    required String? code,
    required double? price,
    required double? note,
    required double? discount,
    required String? status,
    required String? createdAt,
  }) : super(
    name: name,
    description: description,
    picture: picture,
    code: code,
    price: price,
    note: note,
    discount: discount,
    status: status,
    createdAt: createdAt,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    picture: json["picture"] == null ? null : json["picture"],
    code: json["code"] == null ? null : json["code"],
    price: json["price"] == null ? null : (json["price"] as num).toDouble(),
    note: json["note"] == null ? null : (json["note"] as num).toDouble(),
    discount: json["discount"] == null ? null : (json["discount"] as num).toDouble(),
    status: json["status"] == null ? null : json["status"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "picture": picture == null ? null : picture,
    "code": code == null ? null : code,
    "price": price == null ? null : price,
    "note": note == null ? null : note,
    "discount": discount == null ? null : discount,
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt,
  };

  @override
  List<Object?> get props => [name, description, picture, code, price, note, discount, status, createdAt];
}