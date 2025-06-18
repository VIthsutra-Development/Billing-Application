import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:new_billing/features/history/domain/entities/history_entity.dart';
import 'package:new_billing/features/history/domain/usecases/fetch_history_usecase.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final FetchHistoryUsecase _fetchHistoryUsecase;
  HistoryBloc({
    required FetchHistoryUsecase fetchHistoryUsecase,
  })  : _fetchHistoryUsecase = fetchHistoryUsecase,
        super(HistoryInitial()) {
    on<FetchInvoiceHistoryEvent>(
      (event, emit) async {
        emit(FetchInvoicesLoadingState());
        final response = await _fetchHistoryUsecase(FetchHistoryParams());
        response.fold(
          (failure) {
            emit(FetchInvoiceHistoryFailedState(message: failure.message));
          },
          (success) {
            emit(FetchInvoiceHistorySuccessState(invoices: success));
          },
        );
      },
    );
  }
}
