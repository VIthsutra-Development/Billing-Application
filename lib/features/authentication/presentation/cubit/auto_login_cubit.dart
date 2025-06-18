import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/authentication/domain/usecases/auto_login_usecase.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<AutoLoginState> {
  final AutoLoginUsecase _autoLoginUsecase;
  AutoLoginCubit({
    required AutoLoginUsecase autoLoginUsecase,
  })  : _autoLoginUsecase = autoLoginUsecase,
        super(AutoLoginInitial());
  Future<void> autoLogin() async {
    final response = await _autoLoginUsecase(AutoLoginParams());
    response.fold((failure) {
      emit(AutoLoginFailureState());
    }, (success) {
      emit(AutoLoginSuccessState(token: success));
    });
  }
}
