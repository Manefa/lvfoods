import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String? name;

  Product({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };

  @override
  List<Object?> get props => [name];
}