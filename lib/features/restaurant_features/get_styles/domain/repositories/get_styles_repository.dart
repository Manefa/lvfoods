
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/get_styles_master.dart';

abstract class GetStylesRepository {
  Future<Either<Failure, GetStylesMaster>> getStyles();
}