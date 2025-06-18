import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/logistic/domain/usecases/add_logistic_usecase.dart';

part 'add_logistic_state.dart';

class AddLogisticCubit extends Cubit<AddLogisticState> {
  final AddLogisticUsecase _addLogisticUsecase;
  AddLogisticCubit({required AddLogisticUsecase addLogisticUsecase})
      : _addLogisticUsecase = addLogisticUsecase,
        super(AddLogisticInitial());
  Future<void> addLogistic({
    required String logisticName,
    required String logisticAddress,
    required String logisticGstNumber,
    required String logisticPhoneNumber,
    required String logisticState,
    required String logisticStateCode,
  }) async {
    emit(AddLogisticLoadingState());
    final response = await _addLogisticUsecase(
      AddLogisticParams(
        logisticAddress: logisticAddress,
        logisticGstNumber: logisticGstNumber,
        logisticName: logisticName,
        logisticPhoneNumber: logisticPhoneNumber,
        logisticState: logisticState,
        logisticStateCode: logisticStateCode,
      ),
    );
    response.fold(
      (failure) {
        emit(
          AddLogisticFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          AddLogisticSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
