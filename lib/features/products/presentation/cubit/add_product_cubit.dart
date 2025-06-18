import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/products/domain/usecases/add_product_usecase.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUsecase _addProductUsecase;
  AddProductCubit({required AddProductUsecase addProductUsecase})
      : _addProductUsecase = addProductUsecase,
        super(AddProductInitial());
  Future<void> addProduct({
    required String productName,
    required String productHsn,
    required String productQty,
    required String productRate,
    required String productUnit,
  }) async {
    emit(AddProductLoadingState());
    final response = await _addProductUsecase(
      AddProductsParams(
        productHsn: productHsn,
        productName: productName,
        productQty: productQty,
        productRate: productRate,
        productUnit: productUnit,
      ),
    );
    response.fold(
      (failure) {
        emit(
          AddProductFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          AddProductSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
