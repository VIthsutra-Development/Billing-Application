import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/authentication/domain/usecases/forgotpass_usecase.dart';
import 'package:new_billing/features/authentication/domain/usecases/login_usecase.dart';
import 'package:new_billing/features/authentication/domain/usecases/otp_usecase.dart';
import 'package:new_billing/features/authentication/domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final ForgotPassUsecase _forgotPassUsecase;
  final OtpUsecase _otpUsecase;
  AuthBloc({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required ForgotPassUsecase forgotPassUsecase,
    required OtpUsecase otpUsecase,
  })  : _loginUsecase = loginUsecase,
        _registerUsecase = registerUsecase,
        _forgotPassUsecase = forgotPassUsecase,
        _otpUsecase = otpUsecase,
        super(AuthInitial()) {
    on<AuthLoginEvent>(_authLogin);
    on<AuthRegisterEvent>(_authRegister);
    on<AuthForgotPassEvent>(_authForgotPass);
    on<AuthOtpEvent>(_authOtp);
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
        userPhone: event.userPhone,
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

  Future<void> _authForgotPass(
    AuthForgotPassEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response =
        await _forgotPassUsecase(ForgotPassParams(email: event.email));
    response.fold((fail) {
      emit(AuthFailureState(message: fail.message));
    }, (success) {
      emit(AuthSuccessState(message: success));
    });
  }

  FutureOr<void> _authOtp(AuthOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _otpUsecase(OtpParams(otp: event.otp));
    response.fold((fail) {
      emit(AuthFailureState(message: fail.message));
    }, (sucess) {
      emit(AuthSuccessState(message: sucess));
    });
  }
}
