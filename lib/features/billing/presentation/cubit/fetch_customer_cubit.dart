import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/usecases/fetch_customer_usecase.dart';

part 'fetch_customer_state.dart';

class FetchCustomerCubits extends Cubit<FetchCustomerState> {
  final FetchCustomerUsecases _fetchCustomerUsecase;
  FetchCustomerCubits({required FetchCustomerUsecases fetchCustomerUsecase})
      : _fetchCustomerUsecase = fetchCustomerUsecase,
        super(FetchCustomerInitial());
  Future<void> fetchCustomers() async {
    emit(FetchCustomersLoadingState());
    final response = await _fetchCustomerUsecase(FetchCustomerParams());
    response.fold(
      (failure) {
        emit(
          FetchCustomersFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchCustomersSuccessState(
            customers: success,
          ),
        );
      },
    );
  }
}
