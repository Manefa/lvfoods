
import 'package:equatable/equatable.dart';

abstract class GetCategoriesEvent extends Equatable {
  const GetCategoriesEvent();
}

class StartGetCategories extends GetCategoriesEvent{

  @override
  List<Object?> get props => [];
}
