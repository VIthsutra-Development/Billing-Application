import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/usecases/fetch_logistics_usecase.dart';

part 'fetch_logistic_state.dart';

class FetchLogisticCubits extends Cubit<FetchLogisticState> {
  final FetchLogisticsUsecases _fetchLogisticsUsecase;
  FetchLogisticCubits({required FetchLogisticsUsecases fetchLogisticsUsecase})
      : _fetchLogisticsUsecase = fetchLogisticsUsecase,
        super(FetchLogisticInitial());
  Future<void> fetchLogistics() async {
    final response = await _fetchLogisticsUsecase(FetchLogisticsParams());
    response.fold(
      (failure) {
        emit(
          FetchLogisticsFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchLogisticSuccessState(
            logistics: success,
          ),
        );
      },
    );
  }
}
