import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String? name;
  final String? code;
  final String? picture;
  final List<String>? styles;
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
    "styles": List<String>.from(styles!.map((x) => x)),
    "products": List<String>.from(products!.map((x) => x)),
    "_id": id,
  };

  @override
  List<Object?> get props => [name, code, picture, styles, products];
}