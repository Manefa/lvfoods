import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String? id;
  final String? name;

  Category({
    required this.id,
    required this.name,
  });

  // factory Category.fromJson(Map<String, dynamic> json) => Category(
  //   id: json["_id"] == null ? null : json["_id"],
  //   name: json["name"] == null ? null : json["name"],
  // );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
  };

  @override
  List<Object?> get props => [id, name];
}