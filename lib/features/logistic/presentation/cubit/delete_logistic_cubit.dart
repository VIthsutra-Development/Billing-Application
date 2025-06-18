import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/logistic/domain/usecases/delete_logistic_usecase.dart';

part 'delete_logistic_state.dart';

class DeleteLogisticCubit extends Cubit<DeleteLogisticState> {
  final DeleteLogisticUsecase _deleteLogisticUsecase;
  DeleteLogisticCubit({
    required DeleteLogisticUsecase deleteLogisticUsecase,
  })  : _deleteLogisticUsecase = deleteLogisticUsecase,
        super(DeleteLogisticInitial());

  Future<void> deleteLogistic({
    required String logisticId,
  }) async {
    emit(DeleteLogisticLoadingState());
    final response = await _deleteLogisticUsecase(
      DeleteLogisticParams(
        logisticId: logisticId,
      ),
    );
    response.fold(
      (failure) {
        emit(
          DeleteLogisticFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          DeleteLogisticSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
