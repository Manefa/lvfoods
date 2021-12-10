import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/deliveries_usecases/get_deliveries_usecase.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/repositories/get_deliveries_repository.dart';


class GetDeliveriesUseCase extends UseCaseGetDeliveries<DeliveriesMasters, NoParams>{
  final GetDeliveriesRepository repository;

  GetDeliveriesUseCase(this.repository);

  @override
  Future<Either<Failure, DeliveriesMasters>> call(NoParams params) async {
    return await repository.getDeliveries();
  }
}