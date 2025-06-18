import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/authentication/domain/usecases/login_usecase.dart';
import 'package:new_billing/features/authentication/domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  AuthBloc({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
  })  : _loginUsecase = loginUsecase,
        _registerUsecase = registerUsecase,
        super(AuthInitial()) {
    on<AuthLoginEvent>(_authLogin);
    on<AuthRegisterEvent>(_authRegister);
  }

  Future<void> _authLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _loginUsecase(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (failure) {
        emit(
          AuthFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          AuthSuccessState(
            message: success,
          ),
        );
      },
    );
  }

  Future<void> _authRegister(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _registerUsecase(
      RegisterParams(
        userName: event.userName,
        email: event.email,
        password: event.password,
        userPhone:event.userPhone,
      ),
    );
    response.fold(
      (failure) {
        emit(
          AuthFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          AuthSuccessState(
            message: success,
          ),
        );
      },
    );
  }
}
