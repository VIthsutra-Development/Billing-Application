import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/usecases/fetch_firms_usecase.dart';

part 'fetch_firm_state.dart';

class FetchFirmCubits extends Cubit<FetchFirmState> {
  final FetchFirmsUsecases _fetchFirmsUsecase;
  FetchFirmCubits({
    required FetchFirmsUsecases fetchFirmsUsecase,
  })  : _fetchFirmsUsecase = fetchFirmsUsecase,
        super(FetchFirmInitial());
  Future<void> fetchFirms() async {
    emit(FetchFirmLoadingState());
    final response = await _fetchFirmsUsecase(FetchFirmsParams());
    response.fold(
      (failure) {
        FetchFirmFailureState(
          message: failure.message,
        );
      },
      (success) {
        emit(
          FetchFirmSuccessState(
            firms: success,
          ),
        );
      },
    );
  }
}
