import 'package:equatable/equatable.dart';

class ForAddPhone extends Equatable{
  final String? codes;
  final String? contents;

  ForAddPhone({
    required this.codes,
    required this.contents,
  });

  // factory AddPhone.fromJson(Map<String, dynamic> json) => AddPhone(
  //   codes: json["codes"] == null ? null : json["codes"],
  //   contents: json["contents"] == null ? null : json["contents"],
  // );

  Map<String, dynamic> toJson() => {
    "codes": codes == null ? null : codes,
    "contents": contents == null ? null : contents,
  };

  @override
  List<Object?> get props => [codes, contents];
}