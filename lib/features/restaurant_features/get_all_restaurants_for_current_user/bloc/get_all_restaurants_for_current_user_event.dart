import 'package:equatable/equatable.dart';

abstract class GetAllRestaurantsForCurrentUserEvent extends Equatable {
  const GetAllRestaurantsForCurrentUserEvent();
}

class StartGetAllRestaurantsForCurrentUser extends GetAllRestaurantsForCurrentUserEvent{

  @override
  List<Object?> get props => [];
}
