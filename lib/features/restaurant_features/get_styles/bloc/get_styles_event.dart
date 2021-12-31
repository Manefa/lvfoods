
import 'package:equatable/equatable.dart';

abstract class GetStylesEvent extends Equatable {
  const GetStylesEvent();
}

class StartGetStyles extends GetStylesEvent{

  @override
  List<Object?> get props => [];
}
