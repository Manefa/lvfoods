import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country_master.dart';

abstract class GetCountryState extends Equatable {
  const GetCountryState();
}

class GetCountryEmpty extends GetCountryState {
  @override
  List<Object> get props => [];
}

class GetCountryLoading extends GetCountryState {
  @override
  List<Object> get props => [];
}

class GetCountryLoaded extends GetCountryState {
  final CountryMaster countryMaster;

  GetCountryLoaded({required this.countryMaster});
  @override
  List<Object> get props => [countryMaster];
}

class GetCountryError extends GetCountryState {
  final String message;

  GetCountryError({required this.message});
  @override
  List<Object> get props => [message];
}
