import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/firm/domain/usecases/delete_firm_usecase.dart';

part 'delete_firm_state.dart';

class DeleteFirmCubit extends Cubit<DeleteFirmState> {
  final DeleteFirmUsecase _deleteFirmUsecase;
  DeleteFirmCubit({
    required DeleteFirmUsecase deleteFirmUsecase,
  })  : _deleteFirmUsecase = deleteFirmUsecase,
        super(DeleteFirmInitial());

  Future<void> deleteFirm({
    required String firmId,
  }) async {
    emit(DeleteFirmLoadingState());
    final response = await _deleteFirmUsecase(
      DeleteFirmParams(
        firmId: firmId,
      ),
    );
    response.fold(
      (failure) {
        emit(
          DeleteFirmFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          DeleteFirmSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}