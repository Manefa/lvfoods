import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_all_restaurants_for_current_user/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/bloc/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/usecases/get_all_restaurants_for_current_user.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class GetAllRestaurantsForCurrentUserBloc extends Bloc<GetAllRestaurantsForCurrentUserEvent, GetAllRestaurantsForCurrentUserState> {
  final GetAllRestaurantsForCurrentUserUseCase _getAllRestaurantsForCurrentUserUseCase;
  GetAllRestaurantsForCurrentUserBloc({required GetAllRestaurantsForCurrentUserUseCase getAllRestaurantsForCurrentUserUseCase}) : assert(getAllRestaurantsForCurrentUserUseCase!= null),
  _getAllRestaurantsForCurrentUserUseCase = getAllRestaurantsForCurrentUserUseCase,
        super(GetAllRestaurantsForCurrentUserEmpty());

  @override
  Stream<GetAllRestaurantsForCurrentUserState> mapEventToState(GetAllRestaurantsForCurrentUserEvent event) async* {
    if(event is StartGetAllRestaurantsForCurrentUser) {
      yield GetAllRestaurantsForCurrentUserLoading();
      final failureOrGetAllRestaurantsForCurrentUserResponse = await _getAllRestaurantsForCurrentUserUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrGetAllRestaurantsForCurrentUserResponse);
    }
  }

  Stream<GetAllRestaurantsForCurrentUserState> _eitherLoadedOrErrorState(
      Either<Failure, GetAllRestaurantsForCurrentUser> either,
      ) async* {
    yield either.fold(
          (failure) => GetAllRestaurantsForCurrentUserError(message: _mapFailureToMessage(failure)),
          (getAllRestaurantsForCurrentUser) => GetAllRestaurantsForCurrentUserLoaded(getAllRestaurantsForCurrentUser: getAllRestaurantsForCurrentUser),
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
