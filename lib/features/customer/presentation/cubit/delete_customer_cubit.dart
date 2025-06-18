import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/customer/domain/usecases/delete_customer_usecase.dart';

part 'delete_customer_state.dart';

class DeleteCustomerCubit extends Cubit<DeleteCustomerState> {
  final DeleteCustomerUsecase _deleteCustomerUsecase;
  DeleteCustomerCubit({
    required DeleteCustomerUsecase deleteCustomerUsecase,
  })  : _deleteCustomerUsecase = deleteCustomerUsecase,
        super(DeleteCustomerInitial());

  Future<void> deleteCustomer({
    required String customerId,
  }) async {
    emit(DeleteCustomerLoadingState());
    final response = await _deleteCustomerUsecase(
      DeleteCustomerParams(
        customerId: customerId,
      ),
    );
    response.fold(
      (failure) {
        emit(
          DeleteCustomerFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          DeleteCustomerSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
