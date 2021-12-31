import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/categorys.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/notice.dart';

class Product extends Equatable{
  final String? name;
  final String? description;
  final String? picture;
  final String? code;
  final double? price;
  final double? note;
  final double? discount;
  final List<Notice>? notices;
  final List<Categorys>? categories;
  final String? status;

  Product({
    required this.name,
    required this.description,
    required this.picture,
    required this.code,
    required this.price,
    required this.note,
    required this.discount,
    required this.notices,
    required this.categories,
    required this.status,
  });

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

  @override
  List<Object?> get props => [name, description, picture, code, price, note, discount,
  notices, categories, status];
}