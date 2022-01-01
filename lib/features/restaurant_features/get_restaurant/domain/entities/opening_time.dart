import 'package:equatable/equatable.dart';

class OpeningTime extends Equatable{
  final String? open;
  final String? close;

  OpeningTime({
    required final this.open,
    required final this.close,
  });

  Map<String, dynamic> toJson() => {
    "open": open,
    "close": close,
  };

  @override
  List<Object?> get props => [open, close];
}