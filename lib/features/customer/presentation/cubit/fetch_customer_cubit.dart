import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/customer/domain/entities/customer_entity.dart';
import 'package:new_billing/features/customer/domain/usecases/fetch_customer_usecase.dart';

part 'fetch_customer_state.dart';

class FetchCustomerCubit extends Cubit<FetchCustomerState> {
  final FetchCustomerUsecase _fetchCustomerUsecase;
  FetchCustomerCubit({
    required FetchCustomerUsecase fetchCustomerUsecase,
  })  : _fetchCustomerUsecase = fetchCustomerUsecase,
        super(FetchCustomerInitial());

  Future<void> fetchCustomers() async {
    emit(FetchCustomerLoadingState());
    final response = await _fetchCustomerUsecase(
      FetchCustomerParams(),
    );
    response.fold(
      (failure) {
        emit(
          FetchCustomerFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchCustomerSuccessState(
            customers: success,
          ),
        );
      },
    );
  }
}
