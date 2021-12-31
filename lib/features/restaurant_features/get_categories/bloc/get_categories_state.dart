
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/get_categories_master.dart';

abstract class GetCategoriesState extends Equatable {
  const GetCategoriesState();
}

class GetCategoriesEmpty extends GetCategoriesState {
  @override
  List<Object> get props => [];
}

class GetCategoriesLoading extends GetCategoriesState {
  @override
  List<Object> get props => [];
}

class GetCategoriesLoaded extends GetCategoriesState {
  final GetCategoriesMaster getCategoriesMaster;

  GetCategoriesLoaded({required this.getCategoriesMaster});
  @override
  List<Object> get props => [getCategoriesMaster];
}

class GetCategoriesError extends GetCategoriesState {
  final String message;

  GetCategoriesError({required this.message});
  @override
  List<Object> get props => [message];
}
