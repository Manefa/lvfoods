import 'package:equatable/equatable.dart';

class Style extends Equatable{
  final String? id;
  final String? name;

  Style({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
  };

  @override
  List<Object?> get props => [id, name];
}