import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/home/domain/usecases/logout_usecase.dart';

part 'logout_cubit_state.dart';

class LogoutCubitCubit extends Cubit<LogoutCubitState> {
  final LogoutUsecase _logoutUsecase;
  LogoutCubitCubit({
    required LogoutUsecase logoutUsecase,
  })  : _logoutUsecase = logoutUsecase,
        super(LogoutCubitInitial());

  Future<void> logout() async {
    final response = await _logoutUsecase(LogoutParams());
    response.fold(
      (failure) {
        emit(LogoutFailureState());
      },
      (success) {
        emit(LogoutSuccessState());
      },
    );
  }
}
