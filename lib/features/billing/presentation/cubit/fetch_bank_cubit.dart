import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/usecases/fetch_banks_usecase.dart';

part 'fetch_bank_state.dart';

class FetchBankCubits extends Cubit<FetchBankState> {
  final FetchBanksUsecases _fetchBankUsecase;
  FetchBankCubits({required FetchBanksUsecases fetchBankUsecase})
      : _fetchBankUsecase = fetchBankUsecase,
        super(FetchBankInitial());
  Future<void> fetchBanks() async {
    emit(FetchBankLoadingState());
    final response = await _fetchBankUsecase(FetchBanksParams());
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
            banks: success,
          ),
        );
      },
    );
  }
}
