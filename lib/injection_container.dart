import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ivfoods_mobile_app/bloc_localization/locale.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/auth/blocs/auth/auth.dart';
import 'package:ivfoods_mobile_app/features/auth/blocs/sign_in/Sign_in.dart';
import 'package:ivfoods_mobile_app/features/auth/data/datasources/sign_in_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/auth/data/repositories/sign_in_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/repositories/sign_in_repository.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/usecases/sign_in.dart';
import 'package:ivfoods_mobile_app/features/delivered/bloc/delivered.dart';
import 'package:ivfoods_mobile_app/features/delivered/data/datasources/delivered_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/delivered/data/repositories/delivered_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/repositories/delivered_repository.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/usecases/delivered.dart';
import 'package:ivfoods_mobile_app/features/deliveries/bloc/deliveries.dart';
import 'package:ivfoods_mobile_app/features/deliveries/data/datasources/get_deliveries_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/deliveries/data/datasources/get_deliveries_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/deliveries/data/repositories/get_deliveries_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/repositories/get_deliveries_repository.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/usecases/get_deliveries.dart';
import 'package:ivfoods_mobile_app/features/deposited/bloc/deposited.dart';
import 'package:ivfoods_mobile_app/features/deposited/data/datasources/deposited_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/deposited/data/repositories/deposited_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/repositories/deposited_repository.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/usecases/deposited.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/bloc/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/datasources/get_all_for_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/repositories/get_all_for_restaurant_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/repositories/get_all_for_restaurant_repository.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/usecases/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/bloc/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/datasources/get_one_for_deliver_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/repositories/get_one_for_deliver_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/repositories/get_one_for_deliver_repository.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/usecases/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/datasources/get_user_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/datasources/get_user_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/repositories/get_user_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/repositories/get_user_repository.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/usecases/get_user.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/bloc/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/data/datasources/on_the_way_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/data/repositories/on_the_way_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/usecases/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/orders/bloc/orders.dart';
import 'package:ivfoods_mobile_app/features/orders/data/datasources/get_orders_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/orders/data/datasources/get_orders_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/orders/data/repositories/get_orders_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/repositories/get_orders_repository.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/usecases/get_orders.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/bloc/paid_delivery.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/data/datasources/paid_delivery_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/data/repositories/paid_delivery_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/repositories/paid_delivery_repository.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/usecases/paid_delivery.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/bloc/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/data/datasources/order_group_paid_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/data/repositories/order_group_paid_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/repositories/order_group_paid_repository.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/usecases/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/bloc/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/data/datasources/add_hours_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/data/repositories/add_hours_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/repository/add_hours_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/usecases/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/bloc/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/data/datasources/add_phone_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/data/repositories/add_phone_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/repository/add_phone_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/usecases/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/bloc/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/data/datasources/create_product_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/data/repositories/create_product_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/repositories/create_product_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/usecases/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/bloc/add_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/data/datasources/create_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/data/repositories/add_restaurant_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/repositories/add_restaurant_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/usecases/add_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/bloc/delete_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/data/datasources/delete_product_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/data/repositories/delete_product_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/repositories/delete_product_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/usecases/delete_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/bloc/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/data/datasources/get_all_for_owner_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/data/repositories/get_all_for_owner_restaurant_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/repositories/get_all_for_owner_restaurant_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/usecases/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/bloc/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/datasources/get_all_restaurants_for_current_user_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/datasources/get_all_restaurants_for_current_user_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/repositories/get_all_restaurants_for_current_user_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/repositories/get_all_restaurants_for_current_user_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/usecases/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/bloc/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/data/datasources/get_categories_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/data/repositories/get_categories_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/repositories/get_categories_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/usecases/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/bloc/get_city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/data/datasources/get_city_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/data/repository/get_city_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/repositories/get_city_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/usecases/get_city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/bloc/get_country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/data/datasources/get_country_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/data/repository/get_country_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/repositories/get_country_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/usecases/get_country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/bloc/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/datasources/get_one_restaurant_and_populate_products_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/datasources/get_one_restaurant_and_populate_products_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/repositories/get_one_restaurant_and_populate_products_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/repositories/get_one_restaurant_and_populate_products_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/usecases/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/bloc/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/datasources/get_product_details_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/datasources/get_product_details_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/repositories/get_product_details_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/repositories/get_product_details_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/usecases/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/bloc/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/datasources/get_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/repositories/get_restaurant_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/repository/get_restaurant_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/usecases/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/bloc/get_styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/data/datasources/get_styles_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/data/repositories/get_styles_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/repositories/get_styles_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/usecases/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/bloc/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/data/datasources/mention_order_ready_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/data/repositories/mention_order_ready_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/repository/mention_order_ready_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/usecases/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/bloc/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/data/datasources/remove_hours_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/data/repositories/remove_hours_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/repository/remove_hours_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/usecases/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/bloc/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/data/datasources/remove_phone_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/data/repositories/remove_phone_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/repository/remove_phone_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/usecases/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/bloc/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/data/datasources/update_product_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/data/repositories/update_product_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/repositories/update_product_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/usecases/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/bloc/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/data/datasources/update_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/data/repositories/update_restaurant_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/repositories/update_restaurant_repository.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/usecases/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/bloc/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/data/datasources/start_deposition_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/data/repositories/start_depostion_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/repositories/start_deposition_repository.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/usecases/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/bloc/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/data/datasources/start_recovery_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/data/repositories/start_recovery_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/repository/start_recovery_repository.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/usecases/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/bloc/take_delivery.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/data/datasources/take_delivery_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/data/repositories/take_delivery_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/repositories/take_delivery_repository.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/usecases/take_delivery.dart';
import 'package:ivfoods_mobile_app/features/update_password/bloc/update_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/data/datasources/update_password_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/update_password/data/repositories/update_password_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/repositories/update_password_repository.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/usecases/update_password.dart';
import 'package:ivfoods_mobile_app/features/update_users/bloc/update_user.dart';
import 'package:ivfoods_mobile_app/features/update_users/data/datasources/update_user_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/update_users/data/repositories/update_user_repository_impl.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/repositories/update_user_repository.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/usecases/update_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  //Bloc
  sl.registerFactory(
        () => AuthBloc(),
  );

  sl.registerFactory<SignInBloc>(
        () => SignInBloc(
          signIn: sl(),
        ),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Repository
  sl.registerLazySingleton<SignInRepository>(
        () => SignInRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<SignInRemoteDataSource>(
        () => SignInRemoteDataSourceImpl(client: sl()),
  );

  //! Features - Deliveries
  //Bloc

  sl.registerFactory<DeliveriesBloc>(
        () => DeliveriesBloc(
      getDeliveriesUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetDeliveriesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetDeliveriesRepository>(
        () => GetDeliveriesRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetDeliveriesRemoteDataSource>(
        () => GetDeliveriesRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<GetDeliveriesLocalDataSource>(
        () => GetDeliveriesLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Features - Orders
  //Bloc

  sl.registerFactory<OrdersBloc>(
        () => OrdersBloc(
      getOrdersUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetOrdersUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetOrdersRepository>(
        () => GetOrdersRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetOrdersRemoteDataSource>(
        () => GetOrdersRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<GetOrdersLocalDataSource>(
        () => GetOrdersLocalDataSourceImpl(sharedPreferences: sl()),
  );


  //! Features - GetAllForRestaurant
  //Bloc

  sl.registerFactory<GetAllForRestaurantBloc>(
        () => GetAllForRestaurantBloc(
      getAllForRestaurantUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllForRestaurantUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetAllForRestaurantRepository>(
        () => GetAllForRestaurantRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetAllForRestaurantRemoteDataSource>(
        () => GetAllForRestaurantRemoteDataSourceImpl(client: sl()),
  );

  //! Features - GetUser
  //Bloc

  sl.registerFactory<GetUserBloc>(
        () => GetUserBloc(
      getUserUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetUserRepository>(
        () => GetUserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetUserRemoteDataSource>(
        () => GetUserRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<GetUserLocalDataSource>(
        () => GetUserLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Features - StartRecovery
  //Bloc

  sl.registerFactory<StartRecoveryBloc>(
        () => StartRecoveryBloc(
      startRecoveryUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => StartRecoveryUseCase(sl()));

  // Repository
  sl.registerLazySingleton<StartRecoveryRepository>(
        () => StartRecoveryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<StartRecoveryRemoteDataSource>(
        () => StartRecoveryRemoteDataSourceImpl(client: sl()),
  );


  //! Features - StartDeposition
  //Bloc

  sl.registerFactory<StartDepositionBloc>(
        () => StartDepositionBloc(
      startDepositionUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => StartDepositionUseCase(sl()));

  // Repository
  sl.registerLazySingleton<StartDepositionRepository>(
        () => StartDepositionRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<StartDepositionRemoteDataSource>(
        () => StartDepositionRemoteDataSourceImpl(client: sl()),
  );

  //! Features - Deposited
  //Bloc

  sl.registerFactory<DepositedBloc>(
        () => DepositedBloc(
      depositedUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => DepositedUseCase(sl()));

  // Repository
  sl.registerLazySingleton<DepositedRepository>(
        () => DepositedRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DepositedRemoteDataSource>(
        () => DepositedRemoteDataSourceImpl(client: sl()),
  );

  //! Features - UpdateUser
  //Bloc

  sl.registerFactory<UpdateUserBloc>(
        () => UpdateUserBloc(
      updateUserUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => UpdateUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<UpdateUserRepository>(
        () => UpdateUserRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UpdateUserRemoteDataSource>(
        () => UpdateUserRemoteDataSourceImpl(dio: sl()),
  );

  //! Features - GetOneForDeliver
  //Bloc

  sl.registerFactory<GetOneForDeliverBloc>(
        () => GetOneForDeliverBloc(
      getOneForDeliverUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetOneForDeliverUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetOneForDeliverRepository>(
        () => GetOneForDeliverRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetOneForDeliverRemoteDataSource>(
        () => GetOneForDeliverRemoteDataSourceImpl(client: sl()),
  );

  //! Features - Delivered
  //Bloc

  sl.registerFactory<DeliveredBloc>(
        () => DeliveredBloc(
      deliveredUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => DeliveredUseCase(sl()));

  // Repository
  sl.registerLazySingleton<DeliveredRepository>(
        () => DeliveredRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DeliveredRemoteDataSource>(
        () => DeliveredRemoteDataSourceImpl(client: sl()),
  );



  //! Features - OnTheWay
  //Bloc

  sl.registerFactory<OnTheWayBloc>(
        () => OnTheWayBloc(
      onTheWayUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => OnTheWayUseCase(sl()));

  // Repository
  sl.registerLazySingleton<OnTheWayRepository>(
        () => OnTheWayRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<OnTheWayRemoteDataSource>(
        () => OnTheWayRemoteDataSourceImpl(client: sl()),
  );


  //! Features - PaidOrderGroup
  //Bloc

  sl.registerFactory<OrderGroupPaidBloc>(
        () => OrderGroupPaidBloc(
      orderGroupPaidUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => OrderGroupPaidUseCase(sl()));

  // Repository
  sl.registerLazySingleton<OrderGroupPaidRepository>(
        () => OrderGroupPaidRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<OrderGroupPaidRemoteDataSource>(
        () => OrderGroupPaidRemoteDataSourceImpl(client: sl()),
  );

  //! Features - TakeDeliveries
  //Bloc

  sl.registerFactory<TakeDeliveryBloc>(
        () => TakeDeliveryBloc(
      takeDeliveryUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => TakeDeliveryUseCase(sl()));

  // Repository
  sl.registerLazySingleton<TakeDeliveryRepository>(
        () => TakeDeliveryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<TakeDeliveryRemoteDataSource>(
        () => TakeDeliveryRemoteDataSourceImpl(client: sl()),
  );




  //! Features - PaidDelivery
  //Bloc

  sl.registerFactory<PaidDeliveryBloc>(
        () => PaidDeliveryBloc(
      paidDeliveryUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => PaidDeliveryUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PaidDeliveryRepository>(
        () => PaidDeliveryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PaidDeliveryRemoteDataSource>(
        () => PaidDeliveryRemoteDataSourceImpl(client: sl()),
  );

  //! Features - UpdatePassword
  //Bloc

  sl.registerFactory<UpdatePasswordBloc>(
        () => UpdatePasswordBloc(
      updatePasswordUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => UpdatePasswordUseCase(sl()));

  // Repository
  sl.registerLazySingleton<UpdatePasswordRepository>(
        () => UpdatePasswordRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UpdatePasswordRemoteDataSource>(
        () => UpdatePasswordRemoteDataSourceImpl(client: sl()),
  );



  //! Features - GetAllRestaurantsForCurrentUser
  //Bloc

  sl.registerFactory<GetAllRestaurantsForCurrentUserBloc>(
        () => GetAllRestaurantsForCurrentUserBloc(
      getAllRestaurantsForCurrentUserUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllRestaurantsForCurrentUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetAllRestaurantsForCurrentUserRepository>(
        () => GetAllRestaurantsForCurrentUserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetAllRestaurantsForCurrentUserRemoteDataSource>(
        () => GetAllRestaurantsForCurrentUserRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<GetAllRestaurantsForCurrentUserLocalDataSource>(
        () => GetAllRestaurantsForCurrentUserLocalDataSourceImpl(sharedPreferences: sl()),
  );


  //! Features - AddRestaurant
  //Bloc

  sl.registerFactory<AddRestaurantBloc>(
        () => AddRestaurantBloc(
      addRestaurantUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddRestaurantUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AddRestaurantRepository>(
        () => AddRestaurantRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AddRestaurantRemoteDataSource>(
        () => AddRestaurantRemoteDataSourceImpl(dio: sl()),
  );

  //! Features - GetOneRestaurantAndPopulateProducts
  //Bloc

  sl.registerFactory<GetOneRestaurantAndPopulateProductsBloc>(
        () => GetOneRestaurantAndPopulateProductsBloc(
      getOneRestaurantAndPopulateProductsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetOneRestaurantAndPopulateProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetOneRestaurantAndPopulateProductsRepository>(
        () => GetOneRestaurantAndPopulateProductsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetOneRestaurantAndPopulateProductsRemoteDataSource>(
        () => GetOneRestaurantAndPopulateProductsRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<GetOneRestaurantAndPopulateProductsLocalDataSource>(
        () => GetOneRestaurantAndPopulateProductsLocalDataSourceImpl(sharedPreferences: sl()),
  );


  //! Features - GetProductDetails
  //Bloc

  sl.registerFactory<GetProductDetailsBloc>(
        () => GetProductDetailsBloc(
      getProductDetailsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetProductDetailsRepository>(
        () => GetProductDetailsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetProductDetailsRemoteDataSource>(
        () => GetProductDetailsRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<GetProductDetailsLocalDataSource>(
        () => GetProductDetailsLocalDataSourceImpl(sharedPreferences: sl()),
  );


  //! Features - DeleteProduct
  //Bloc

  sl.registerFactory<DeleteProductBloc>(
        () => DeleteProductBloc(
      deleteProductUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => DeleteProductUseCase(sl()));

  // Repository
  sl.registerLazySingleton<DeleteProductRepository>(
        () => DeleteProductRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DeleteProductRemoteDataSource>(
        () => DeleteProductRemoteDataSourceImpl(client: sl()),
  );

  //! Features - UpdateProduct
  //Bloc

  sl.registerFactory<UpdateProductBloc>(
        () => UpdateProductBloc(
      updateProductUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => UpdateProductUseCase(sl()));

  // Repository
  sl.registerLazySingleton<UpdateProductRepository>(
        () => UpdateProductRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UpdateProductRemoteDataSource>(
        () => UpdateProductRemoteDataSourceImpl(dio: sl()),
  );

  //! Features - CreateProduct
  //Bloc

  sl.registerFactory<CreateProductBloc>(
        () => CreateProductBloc(
      createProductUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => CreateProductUseCase(sl()));

  // Repository
  sl.registerLazySingleton<CreateProductRepository>(
        () => CreateProductRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CreateProductRemoteDataSource>(
        () => CreateProductRemoteDataSourceImpl(dio: sl()),
  );

  //! Features - GetCategories
  //Bloc

  sl.registerFactory<GetCategoriesBloc>(
        () => GetCategoriesBloc(
      getCategoriesUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetCategoriesRepository>(
        () => GetCategoriesRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetCategoriesRemoteDataSource>(
        () => GetCategoriesRemoteDataSourceImpl(client: sl()),
  );

  //! Features - GetStyles
  //Bloc

  sl.registerFactory<GetStylesBloc>(
        () => GetStylesBloc(
      getStylesUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetStylesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetStylesRepository>(
        () => GetStylesRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetStylesRemoteDataSource>(
        () => GetStylesRemoteDataSourceImpl(client: sl()),
  );

  //! Features - GetRestaurant
  //Bloc

  sl.registerFactory<GetRestaurantBloc>(
        () => GetRestaurantBloc(
      getRestaurantUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetRestaurantUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetRestaurantRepository>(
        () => GetRestaurantRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetRestaurantRemoteDataSource>(
        () => GetRestaurantRemoteDataSourceImpl(client: sl()),
  );

  //! Features - UpdateRestaurant
  //Bloc

  sl.registerFactory<UpdateRestaurantBloc>(
        () => UpdateRestaurantBloc(
      updateRestaurantUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => UpdateRestaurantUseCase(sl()));

  // Repository
  sl.registerLazySingleton<UpdateRestaurantRepository>(
        () => UpdateRestaurantRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UpdateRestaurantRemoteDataSource>(
        () => UpdateRestaurantRemoteDataSourceImpl(dio: sl(),),
  );

  //! Features - AddPhone
  //Bloc

  sl.registerFactory<AddPhoneBloc>(
        () => AddPhoneBloc(
      addPhoneUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddPhoneUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AddPhoneRepository>(
        () => AddPhoneRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AddPhoneRemoteDataSource>(
        () => AddPhoneRemoteDataSourceImpl(client: sl(),),
  );


  //! Features - RemovePhone
  //Bloc

  sl.registerFactory<RemovePhoneBloc>(
        () => RemovePhoneBloc(
      removePhoneUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => RemovePhoneUseCase(sl()));

  // Repository
  sl.registerLazySingleton<RemovePhoneRepository>(
        () => RemovePhoneRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemovePhoneRemoteDataSource>(
        () => RemovePhoneRemoteDataSourceImpl(client: sl(),),
  );



  //! Features - AddHours
  //Bloc

  sl.registerFactory<AddHoursBloc>(
        () => AddHoursBloc(
      addHoursUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddHoursUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AddHoursRepository>(
        () => AddHoursRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AddHoursRemoteDataSource>(
        () => AddHoursRemoteDataSourceImpl(client: sl(),),
  );


  //! Features - RemoveHours
  //Bloc

  sl.registerFactory<RemoveHoursBloc>(
        () => RemoveHoursBloc(
      removeHoursUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => RemoveHoursUseCase(sl()));

  // Repository
  sl.registerLazySingleton<RemoveHoursRepository>(
        () => RemoveHoursRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoveHoursRemoteDataSource>(
        () => RemoveHoursRemoteDataSourceImpl(client: sl(),),
  );

  //! Features - GetAllForOwnerRestaurant
  //Bloc

  sl.registerFactory<GetAllForOwnerRestaurantBloc>(
        () => GetAllForOwnerRestaurantBloc(
      getAllForOwnerRestaurantUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllForOwnerRestaurantUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetAllForOwnerRestaurantRepository>(
        () => GetAllForOwnerRestaurantRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetAllForOwnerRestaurantRemoteDataSource>(
        () => GetAllForOwnerRestaurantRemoteDataSourceImpl(client: sl(),),
  );


  //! Features - MentionOrderReady
  //Bloc

  sl.registerFactory<MentionOrderReadyBloc>(
        () => MentionOrderReadyBloc(
      mentionOrderReadyUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => MentionOrderReadyUseCase(sl()));

  // Repository
  sl.registerLazySingleton<MentionOrderReadyRepository>(
        () => MentionOrderReadyRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MentionOrderReadyRemoteDataSource>(
        () => MentionOrderReadyRemoteDataSourceImpl(client: sl(),),
  );


  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


  //! Features - Localization
  //Bloc

  sl.registerFactory<LocaleBloc>(
        () => LocaleBloc(),
  );

  //! Features - GetCity
  //Bloc

  sl.registerFactory<GetCityBloc>(
        () => GetCityBloc(
      getCityUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCityUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetCityRepository>(
        () => GetCityRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetCityRemoteDataSource>(
        () => GetCityRemoteDataSourceImpl(client: sl(),),
  );


  //! Features - GetCountry
  //Bloc

  sl.registerFactory<GetCountryBloc>(
        () => GetCountryBloc(
      getCountryUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCountryUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GetCountryRepository>(
        () => GetCountryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GetCountryRemoteDataSource>(
        () => GetCountryRemoteDataSourceImpl(client: sl(),),
  );


  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
