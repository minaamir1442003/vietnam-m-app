import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/feature/auth/presentation/cubit/verfy_code/verify_code_state.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/verify_email_response_entity.dart';
import '../../../domain/use_case/auth_use_case.dart';

@injectable
class VerifyOtpViewModel extends Cubit<VerifyOtpState> {
  final AuthUseCase _useCase;

  VerifyOtpViewModel(this._useCase) : super(const VerifyOtpInitial());
  final otpController = TextEditingController();

  Future<void> submit({
    required String email,
  }) async {
    if (otpController.text.length != 6) {
      emit(const VerifyOtpError('Please enter valid OTP'));
      return;
    }

    emit(const VerifyOtpLoading());

    final result = await _useCase.verifyOtp(
      VerifyOtpRequestEntity(
        email: email,
        otp: otpController.text,
      ),
    );

    switch (result) {
      case Success():
        final data = result.data;
        if (data?.status == true) {
          emit(VerifyOtpSuccess(data?.message ?? 'OTP verified'));
        } else {
          emit(VerifyOtpError(data?.message ?? 'Invalid OTP'));
        }
        break;

      case Error():
        emit(
          VerifyOtpError(result.message ?? 'Something went wrong'),
        );
        break;
    }
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
