import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/bloc/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/usecases/update_product.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final UpdateProductUseCase _updateProductUseCase;
  UpdateProductBloc({required UpdateProductUseCase updateProductUseCase})
      :assert(updateProductUseCase!=null),
  _updateProductUseCase = updateProductUseCase,
        super(UpdateProductEmpty());

  @override
  Stream<UpdateProductState> mapEventToState(UpdateProductEvent event) async*{
    if(event is StartUpdateProduct){
      yield UpdateProductLoading();
      final failureOrUpdateProductResponse = await _updateProductUseCase(Params(forUpdateProduct: event.forUpdateProduct ,code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrUpdateProductResponse);
    }
  }
}

Stream<UpdateProductState> _eitherLoadedOrErrorState(
    Either<Failure, UpdateProduct> either,
    ) async* {
  yield either.fold(
        (failure) => UpdateProductError(message: _mapFailureToMessage(failure)),
        (updateProduct) => UpdateProductLoaded(updateProduct: updateProduct),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CONNECTION_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
