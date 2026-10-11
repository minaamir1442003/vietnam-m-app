import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/feature/auth/domain/use_case/auth_use_case.dart';

import '../../../../../core/common/result.dart';

import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final AuthUseCase _useCase;

  ForgetPasswordViewModel(this._useCase) : super(const ForgetPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    emit(const ForgetPasswordLoading());

    final result = await _useCase.callForgetPassword(
      emailController.text.trim(),
    );

    switch (result) {
      case Success():
        emit(
          ForgetPasswordSuccess(
            email: emailController.text.trim(),
            message: result.data?.message ?? 'OTP sent',
          ),
        );
        break;

      case Error():
        emit(ForgetPasswordError(result.message ?? 'Something went wrong'));
        break;
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
