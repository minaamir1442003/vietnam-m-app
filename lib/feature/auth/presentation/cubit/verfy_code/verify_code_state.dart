sealed class VerifyOtpState {
  const VerifyOtpState();
}

class VerifyOtpInitial extends VerifyOtpState {
  const VerifyOtpInitial();
}

class VerifyOtpLoading extends VerifyOtpState {
  const VerifyOtpLoading();
}

class VerifyOtpSuccess extends VerifyOtpState {
  final String message;
  const VerifyOtpSuccess(this.message);
}

class VerifyOtpError extends VerifyOtpState {
  final String message;
  const VerifyOtpError(this.message);
}
