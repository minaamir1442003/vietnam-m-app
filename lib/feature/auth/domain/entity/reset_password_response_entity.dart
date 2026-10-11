class ResetPasswordResponseEntity {
  final bool? status;
  final String? message;

  ResetPasswordResponseEntity({
    this.status,
    this.message,
  });
}

class ResetPasswordRequestEntity {
  final String email;
  final String otp;
  final String password;
  final String passwordConfirmation;

  ResetPasswordRequestEntity({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "otp": otp,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
  }
}

