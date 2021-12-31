
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_styles/get_styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/get_styles_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/repositories/get_styles_repository.dart';


class GetStylesUseCase extends UseCaseGetStyles<GetStylesMaster, NoParams>{
  final GetStylesRepository repository;

  GetStylesUseCase(this.repository);

  @override
  Future<Either<Failure, GetStylesMaster>> call(NoParams params) async {
    return await repository.getStyles();
  }
}