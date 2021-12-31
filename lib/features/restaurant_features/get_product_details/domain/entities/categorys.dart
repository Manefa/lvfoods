import 'package:equatable/equatable.dart';

class Categorys extends Equatable{
  final String? name;
  final String? id;

  Categorys({
    required this.name,
    required this.id
  });

  // factory Category.fromJson(Map<String, dynamic> json) => Category(
  //   name: json["name"] == null ? null : json["name"],
  // );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "_id": id == null ? null : id,
  };

  @override
  List<Object?> get props => [name];
}