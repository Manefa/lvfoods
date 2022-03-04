import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city_master.dart';

abstract class GetCityState extends Equatable {
  const GetCityState();
}

class GetCityEmpty extends GetCityState {
  @override
  List<Object> get props => [];
}

class GetCityLoading extends GetCityState {
  @override
  List<Object> get props => [];
}

class GetCityLoaded extends GetCityState {
  final CityMaster cityMaster;

  GetCityLoaded({required this.cityMaster});
  @override
  List<Object> get props => [cityMaster];
}

class GetCityError extends GetCityState {
  final String message;

  GetCityError({required this.message});
  @override
  List<Object> get props => [message];
}
