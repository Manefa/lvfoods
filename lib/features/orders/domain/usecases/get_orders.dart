import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/orders_usecases/get_orders_usecase.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/orders_masters.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/repositories/get_orders_repository.dart';

class GetOrdersUseCase extends UseCaseGetOrders<OrdersMasters, NoParams>{
  final GetOrdersRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, OrdersMasters>> call(NoParams params) async {
    return await repository.getOrders();
  }
}