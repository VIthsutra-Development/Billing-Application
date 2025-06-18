import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/products/domain/usecases/delete_product_usecase.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  final DeleteProductUsecase _deleteProductUsecase;
  DeleteProductCubit({
    required DeleteProductUsecase deleteProductUsecase,
  })  : _deleteProductUsecase = deleteProductUsecase,
        super(DeleteProductInitial());

  Future<void> deleteProduct({
    required String productId,
  }) async {
    emit(DeleteProductLoadingState());
    final response = await _deleteProductUsecase(
      DeleteProductParams(
        productId: productId,
      ),
    );
    response.fold(
      (failure) {
        emit(
          DeleteProductFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          DeleteProductSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
