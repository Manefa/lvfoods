import 'dart:io';

import 'package:equatable/equatable.dart';

class ForUpdateProduct extends Equatable{
  final String? name;
  final String? description;
  final double? discount;
  final double? price;
  final String? categories;
  final File? picture;

  ForUpdateProduct({
    required this.name,
    required this.description,
    required this.discount,
    required this.price,
    this.categories,
    this.picture,
  });


  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "discount": discount == null ? null : discount,
    "price": price == null ? null : price,
    "categories": categories == null ? null : categories,
    "picture": picture == null ? null : picture,
  };

  @override
  List<Object?> get props => [name, description, discount, price, categories, picture];
}
