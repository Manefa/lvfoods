
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/get_all_restaurants_for_current_user.dart';

abstract class GetAllRestaurantsForCurrentUserState extends Equatable {
  const GetAllRestaurantsForCurrentUserState();
}

class GetAllRestaurantsForCurrentUserEmpty extends GetAllRestaurantsForCurrentUserState {
  @override
  List<Object> get props => [];
}

class GetAllRestaurantsForCurrentUserLoading extends GetAllRestaurantsForCurrentUserState {
  @override
  List<Object> get props => [];
}

class GetAllRestaurantsForCurrentUserLoaded extends GetAllRestaurantsForCurrentUserState {
  final GetAllRestaurantsForCurrentUser getAllRestaurantsForCurrentUser;

  GetAllRestaurantsForCurrentUserLoaded({required this.getAllRestaurantsForCurrentUser});
  @override
  List<Object> get props => [getAllRestaurantsForCurrentUser];
}

class GetAllRestaurantsForCurrentUserError extends GetAllRestaurantsForCurrentUserState {
  final String message;

  GetAllRestaurantsForCurrentUserError({required this.message});
  @override
  List<Object> get props => [message];
}

