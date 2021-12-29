import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/bloc/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/usecases/create_product.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final CreateProductUseCase _createProductUseCase;
  CreateProductBloc({required CreateProductUseCase createProductUseCase})
      :assert(createProductUseCase != null),
  _createProductUseCase = createProductUseCase,
        super(CreateProductEmpty());

  @override
  Stream<CreateProductState> mapEventToState(CreateProductEvent event) async*{
    if(event is StartCreateProduct){
      yield CreateProductLoading();
      final failureOrCreateProductResponse = await _createProductUseCase(Params(forCreateProduct: event.forCreateProduct));
      yield* _eitherLoadedOrErrorState(failureOrCreateProductResponse);
    }
  }
}

Stream<CreateProductState> _eitherLoadedOrErrorState(
    Either<Failure, CreateProduct> either,
    ) async* {
  yield either.fold(
        (failure) => CreateProductError(message: _mapFailureToMessage(failure)),
        (createProduct) => CreateProductLoaded(createProduct: createProduct),
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
