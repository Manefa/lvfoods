import 'package:equatable/equatable.dart';

class Phone extends Equatable{
  final String? code;
  final String? content;

  Phone({
    required this.code,
    required this.content,
  });

  // factory Phone.fromJson(Map<String, dynamic> json) => Phone(
  //   code: json["code"] == null ? null : json["code"],
  //   content: json["content"] == null ? null : json["content"],
  // );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "content": content == null ? null : content,
  };

  @override
  List<Object?> get props => [code, content];
}