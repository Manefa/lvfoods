import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String? name;
  final String? code;
  final String? picture;
  final List<String>? styles;
  final List<String>? products;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  Category({
    required this.name,
    required this.code,
    required this.picture,
    required this.styles,
    required this.products,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory Category.fromJson(Map<String, dynamic> json) => Category(
  //   name: json["name"] == null ? null : json["name"],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   picture: json["picture"] == null ? null : msgValues.map[json["picture"]],
  //   styles: json["styles"] == null ? null : List<Msg>.from(json["styles"].map((x) => msgValues.map[x])),
  //   products: json["products"] == null ? null : List<Msg>.from(json["products"].map((x) => msgValues.map[x])),
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "picture": picture == null ? null : picture,
    "styles": styles == null ? null : List<dynamic>.from(styles!.map((x) => x)),
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x)),
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };

  @override
  List<Object?> get props => [name, code, picture, styles, products, id, createdAt, updatedAt];
}