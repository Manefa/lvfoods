import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/restaurant.dart';

class GetAllRestaurantsForCurrentUser extends Equatable{

  final bool? success;
  final List<Restaurant>? restaurants;

  GetAllRestaurantsForCurrentUser({
    required final this.success,
    required final this.restaurants,
  });

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "restaurants": restaurants == null ? null : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, restaurants];
}