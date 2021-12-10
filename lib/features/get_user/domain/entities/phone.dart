
import 'package:equatable/equatable.dart';

class Phone extends Equatable{
  final String? code;
  final String? content;

  Phone({
    required final this.code,
    required final this.content,
  });

  Map<String, dynamic> toJson() => {
    "code": code,
    "content": content,
  };


  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    code: json["code"],
    content: json["content"],
  );


  @override
  List<Object?> get props => [code, content];
}