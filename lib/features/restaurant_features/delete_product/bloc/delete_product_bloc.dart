import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/bloc/delete_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/entities/product_delete_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/usecases/delete_product.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final DeleteProductUseCase _deleteProductUseCase;
  DeleteProductBloc({required DeleteProductUseCase deleteProductUseCase})
      :assert(deleteProductUseCase != null),
  _deleteProductUseCase = deleteProductUseCase,
        super(DeleteProductEmpty());

  @override
  Stream<DeleteProductState> mapEventToState(DeleteProductEvent event) async*{
    if(event is StartDeleteProduct){
      yield DeleteProductLoading();
      final failureOrDeleteProductResponse = await _deleteProductUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrDeleteProductResponse);
    }
  }
}

Stream<DeleteProductState> _eitherLoadedOrErrorState(
    Either<Failure, ProductDeleteMaster> either,
    ) async* {
  yield either.fold(
        (failure) => DeleteProductError(message: _mapFailureToMessage(failure)),
        (productDeleteMaster) => DeleteProductLoaded(productDeleteMaster: productDeleteMaster),
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
