import '../../../domain/entity/reset_password_response_entity.dart';

class ResetPasswordState {
  final String password;
  final String confirmPassword;

  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;

  final bool isPasswordValid;
  final bool isConfirmPasswordValid;

  final String? passwordError;
  final String? confirmPasswordError;

  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  final ResetPasswordResponseEntity? successData;

  const ResetPasswordState({
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordHidden = true,
    this.isConfirmPasswordHidden = true,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
    this.passwordError,
    this.confirmPasswordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.successData,
  });

  bool get canSubmit =>
      isPasswordValid &&
          isConfirmPasswordValid &&
          !isLoading;

  ResetPasswordState copyWith({
    String? password,
    String? confirmPassword,
    bool? isPasswordHidden,
    bool? isConfirmPasswordHidden,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    String? passwordError,
    String? confirmPasswordError,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    ResetPasswordResponseEntity? successData,
  }) {
    return ResetPasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isConfirmPasswordHidden:
      isConfirmPasswordHidden ?? this.isConfirmPasswordHidden,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
      isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      successData: successData ?? this.successData,
    );
  }
}
