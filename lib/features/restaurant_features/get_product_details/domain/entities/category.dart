import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String? name;

  Category({
    required this.name,
  });

  // factory Category.fromJson(Map<String, dynamic> json) => Category(
  //   name: json["name"] == null ? null : json["name"],
  // );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };

  @override
  List<Object?> get props => [name];
}