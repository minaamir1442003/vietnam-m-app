import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/reset_password_response_entity.dart';
import '../../../domain/use_case/auth_use_case.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  final AuthUseCase _useCase;

  ResetPasswordViewModel(this._useCase)
      : super(const ResetPasswordState());

  void updatePassword(String value) {
    final valid = value.length >= 6;

    emit(
      state.copyWith(
        password: value,
        isPasswordValid: valid,
        passwordError: valid ? null : 'Password too short',
      ),
    );
  }

  void updateConfirmPassword(String value) {
    final valid = value == state.password;

    emit(
      state.copyWith(
        confirmPassword: value,
        isConfirmPasswordValid: valid,
        confirmPasswordError:
        valid ? null : 'Passwords do not match',
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(
      state.copyWith(
        isPasswordHidden: !state.isPasswordHidden,
      ),
    );
  }

  void toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(
        isConfirmPasswordHidden:
        !state.isConfirmPasswordHidden,
      ),
    );
  }
  Future<void> resetPassword({
    required String email,
    required String otp,
  }) async {
    if (!state.canSubmit) return;

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
      ),
    );

    final result = await _useCase.resetPassword(
      ResetPasswordRequestEntity(
        email: email,
        otp: otp,
        password: state.password,
        passwordConfirmation: state.confirmPassword,
      ),
    );

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            successData: result.data,
          ),
        );
        break;

      case Error():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage:
            result.message ?? 'Reset password failed',
          ),
        );
        break;
    }
  }
}
