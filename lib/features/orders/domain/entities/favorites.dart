import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/product.dart';

class Favorites extends Equatable{
  final List<String>? restaurants;
  final List<Product>? products;

  Favorites({
    required final this.restaurants,
    required final this.products,
  });


  Map<String, dynamic> toJson() => {
    "restaurants": List<dynamic>.from(restaurants!.map((x) => x)),
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [restaurants, products];
}