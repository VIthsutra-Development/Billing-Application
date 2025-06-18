import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/logistic/domain/entities/logistic_entity.dart';
import 'package:new_billing/features/logistic/domain/usecases/fetch_logistic_usecase.dart';

part 'fetch_logistic_state.dart';

class FetchLogisticCubit extends Cubit<FetchLogisticState> {
  final FetchLogisticUsecase _fetchLogisticUsecase;
  FetchLogisticCubit({required FetchLogisticUsecase fetchLogisticUsecase})
      : _fetchLogisticUsecase = fetchLogisticUsecase,
        super(FetchLogisticInitial());

  Future<void> fetchLogistics() async {
    emit(FetchLogisticLoadingState());
    final response = await _fetchLogisticUsecase(FetchLogisticParams());
    response.fold(
      (failure) {
        emit(
          FetchLogisticFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchLogisticSuccessState(
            logistic: success,
          ),
        );
      },
    );
  }
}
