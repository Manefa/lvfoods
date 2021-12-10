import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/product.dart';

class Favorites extends Equatable{
  final List<String>? restaurants;
  final List<Product>? products;

  Favorites({
    required final this.restaurants,
    required final this.products,
  });


  Map<String, dynamic> toJson() => {
    "restaurants": List<String>.from(restaurants!.map((x) => x)),
    "products": List<Product>.from(products!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [restaurants, products];
}