import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/firm/domain/usecases/add_firm_usecase.dart';

part 'add_firm_state.dart';

class AddFirmCubit extends Cubit<AddFirmState> {
  final AddFirmUsecase _addFirmUsecase;

  AddFirmCubit({required AddFirmUsecase addFirmUsecase})
      : _addFirmUsecase = addFirmUsecase,
        super(AddFirmInitial());

  Future<void> addFirm({
    required String firmName,
    required String firmAddress,
    required String firmGstNumber,
    required String firmPhoneNumber,
    required String firmEmail,
    required String firmPan,
    required String firmLogo,
  }) async {
    // Print input values received from frontend
    print("=== Add Firm Request ===");
    print("Firm Name: $firmName");
    print("Firm Address: $firmAddress");
    print("Firm GST Number: $firmGstNumber");
    print("Firm Phone Number: $firmPhoneNumber");
    print("Firm Email: $firmEmail");
    print("Firm PAN: $firmPan");
    print("Firm Logo Path: $firmLogo");
    print("========================");

    emit(AddFirmLoadingState());

    final response = await _addFirmUsecase(
      AddFirmParams(
        firmAddress: firmAddress,
        firmGstNumber: firmGstNumber,
        firmName: firmName,
        firmPhoneNumber: firmPhoneNumber,
        firmEmail: firmEmail,
        firmPan: firmPan,
        firmLogo: File(firmLogo),
      ),
    );

    response.fold(
      (failure) {
        print("Add Firm Failed: ${failure.message}");
        emit(AddFirmFailureState(message: failure.message));
      },
      (success) {
        print("Add Firm Success: $success");
        emit(AddFirmSuccessState(message: success));
      },
    );
  }
}
