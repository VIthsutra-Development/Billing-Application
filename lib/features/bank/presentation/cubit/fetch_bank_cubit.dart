import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/bank/domain/entities/bank_entity.dart';
import 'package:new_billing/features/bank/domain/usecases/fetch_bank_usecase.dart';

part 'fetch_bank_state.dart';

class FetchBankCubit extends Cubit<FetchBankState> {
  final FetchBankUsecase _fetchBankUsecase;
  FetchBankCubit({required FetchBankUsecase fetchBankUsecase})
      : _fetchBankUsecase = fetchBankUsecase,
        super(FetchBankInitial());

  Future<void> fetchBanks() async {
    emit(FetchBankLoadingState());
    final response = await _fetchBankUsecase(FetchBankParams());
    response.fold(
      (failure) {
        emit(
          FetchBankFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchBankSuccessState(
            bank: success,
          ),
        );
      },
    );
  }
}
