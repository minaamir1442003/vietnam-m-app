sealed class ForgetPasswordState {
  const ForgetPasswordState();
}

class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial();
}

class ForgetPasswordLoading extends ForgetPasswordState {
  const ForgetPasswordLoading();
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String email;
  final String message;
  const ForgetPasswordSuccess({
    required this.email,
    required this.message,
  });
}

class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  const ForgetPasswordError(this.message);
}
