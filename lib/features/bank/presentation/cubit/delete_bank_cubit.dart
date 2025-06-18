import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/bank/domain/usecases/delete_bank_usecase.dart';

part 'delete_bank_state.dart';

class DeleteBankCubit extends Cubit<DeleteBankState> {
  final DeleteBankUsecase _deleteBankUsecase;
  DeleteBankCubit({
    required DeleteBankUsecase deleteBankUsecase,
  })  : _deleteBankUsecase = deleteBankUsecase,
        super(DeleteBankInitial());

  Future<void> deleteBank({
    required String bankId,
  }) async {
    emit(DeleteBankLoadingState());
    final response = await _deleteBankUsecase(
      DeleteBankParams(
        bankId: bankId,
      ),
    );
    response.fold(
      (failure) {
        emit(
          DeleteBankFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          DeleteBankSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
