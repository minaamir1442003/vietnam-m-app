import '../../../domain/entity/sign_in_response_entity.dart';

class SignInState {
  final String email;
  final String password;

  final bool isPasswordHidden;
  final bool isEmailValid;
  final bool isPasswordValid;

  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final SignInResponseEntity? successData;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isPasswordHidden = true,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.successData,
  });

  bool get canSubmit =>
      isEmailValid &&
          isPasswordValid &&
          !isLoading;

  SignInState copyWith({
    String? email,
    String? password,
    bool? isPasswordHidden,
    bool? isEmailValid,
    bool? isPasswordValid,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    SignInResponseEntity? successData,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      emailError: emailError,
      passwordError: passwordError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      successData: successData ?? this.successData,
    );
  }
}
