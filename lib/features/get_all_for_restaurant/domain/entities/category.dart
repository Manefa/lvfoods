import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/style.dart';

class Category extends Equatable{
  final String? name;
  final String? code;
  final String? picture;
  final List<Style>? styles;
  final List<String>? products;
  final String? id;

  Category({
    required final this.name,
    required final this.code,
    required final this.picture,
    required final this.styles,
    required final this.products,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "picture": picture,
    "styles": List<Style>.from(styles!.map((x) => x.toJson())),
    "products": List<String>.from(products!.map((x) => x)),
    "_id": id,
  };

  @override
  List<Object?> get props => [name, code, picture, styles, products, id];
}