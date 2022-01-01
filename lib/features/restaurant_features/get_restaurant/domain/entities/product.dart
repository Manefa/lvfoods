import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String? name;
  // final String? description;
  // final String? picture;
  // final String? code;
  // final int? price;
  // final int? note;
  // final int? discount;
  // final String? restaurant;
  // final String? status;
  // final String? id;


  Product({
    required final this.name,
    // required final this.description,
    // required final this.picture,
    // required final this.code,
    // required final this.price,
    // required final this.note,
    // required final this.discount,
    // required final this.restaurant,
    // required final this.status,
    // required final this.id,
  });


  Map<String, dynamic> toJson() => {
    "name": name,
    // "description": description,
    // "picture": picture,
    // "code": code,
    // "price": price,
    // "note": note,
    // "discount": discount,
    // "restaurant": restaurant,
    // "status": status,
    // "_id": id,
  };

  @override
  List<Object?> get props => [name,
    // description, picture, code, price, note, discount, restaurant,status, id
  ];
}