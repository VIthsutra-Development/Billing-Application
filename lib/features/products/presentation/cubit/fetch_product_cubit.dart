import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/products/domain/entities/product_entity.dart';
import 'package:new_billing/features/products/domain/usecases/fetch_product_usecase.dart';

part 'fetch_product_state.dart';

class FetchProductCubit extends Cubit<FetchProductState> {
  final FetchProductUsecase _fetchProductUsecase;
  FetchProductCubit({required FetchProductUsecase fetchProductUsecase})
      : _fetchProductUsecase = fetchProductUsecase,
        super(FetchProductInitial());

  Future<void> fetchProducts() async {
    emit(FetchProductLoadingState());
    final response = await _fetchProductUsecase(FetchProductsParams());
    response.fold(
      (failure) {
        emit(
          FetchProductFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchProductSuccessState(
            product: success,
          ),
        );
      },
    );
  }
}
