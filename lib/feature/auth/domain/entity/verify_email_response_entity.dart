class VerifyOtpResponseEntity {
  final bool? status;
  final String? message;

  VerifyOtpResponseEntity({
    this.status,
    this.message,
  });
}
class VerifyOtpRequestEntity {
  final String email;
  final String otp;

  VerifyOtpRequestEntity({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "otp": otp,
    };
  }
}
