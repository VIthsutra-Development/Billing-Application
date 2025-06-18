import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/bank/domain/usecases/add_bank_usecase.dart';

part 'add_bank_state.dart';

class AddBankCubit extends Cubit<AddBankState> {
  final AddBankUsecase _addBankUsecase;
  AddBankCubit({required AddBankUsecase addBankUsecase})
      : _addBankUsecase = addBankUsecase,
        super(AddBankInitial());
  Future<void> addBank({
    required String bankName,
    required String bankAccountNumber,
    required String bankIfscCode,
    required String bankBranchName,
    required String bankAccountHolderName,
  }) async {
    emit(AddBankLoadingState());
    final response = await _addBankUsecase(
      AddBankParams(
        bankAccountNumber: bankAccountNumber,
        bankIfscCode: bankIfscCode,
        bankName: bankName,
        bankAccountHolderName: bankAccountHolderName,
        bankBranchName: bankBranchName,
      ),
    );
    response.fold(
      (failure) {
        emit(
          AddBankFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          AddBankSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
