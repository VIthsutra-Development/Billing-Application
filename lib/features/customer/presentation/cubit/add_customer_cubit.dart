import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/customer/domain/usecases/add_customer_usecase.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  final AddCustomerUsecase _addCustomerUsecase;
  AddCustomerCubit({required AddCustomerUsecase addCustomerUsecase})
      : _addCustomerUsecase = addCustomerUsecase,
        super(AddCustomerInitial());

  Future<void> addCustomer({
    required String customerName,
    required String customerAddress,
    required String customerGstNumber,
    required String customerState,
    required String customerStateCode,
  }) async {
    emit(AddCustomerLoadingState());
    final response = await _addCustomerUsecase(
      AddCustomerParams(
        customerAddress: customerAddress,
        customerGstNumber: customerGstNumber,
        customerName: customerName,
        customerState: customerState,
        customerStateCode: customerStateCode,
      ),
    );
    response.fold(
      (failure) {
        emit(
          AddCustomerFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          AddCustomerSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
