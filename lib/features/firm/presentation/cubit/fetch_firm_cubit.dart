import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/firm/domain/entities/firm_entity.dart';
import 'package:new_billing/features/firm/domain/usecases/fetch_firm_usecase.dart';

part 'fetch_firm_state.dart';

class FetchFirmCubit extends Cubit<FetchFirmState> {
  final FetchFirmUsecase _fetchFirmUsecase;
  FetchFirmCubit({required FetchFirmUsecase fetchFirmUsecase})
      : _fetchFirmUsecase = fetchFirmUsecase,
        super(FetchFirmInitial());

  Future<void> fetchFirms() async {
    emit(FetchFirmLoadingState());
    final response = await _fetchFirmUsecase(FetchFirmParams());
    response.fold(
      (failure) {
        emit(
          FetchFirmFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          FetchFirmSuccessState(
            firm: success,
          ),
        );
      },
    );
  }
}
