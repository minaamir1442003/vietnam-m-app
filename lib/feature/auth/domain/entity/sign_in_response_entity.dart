class SignInResponseEntity {
  final bool status;
  final String message;
  final String? token;

  SignInResponseEntity({
    required this.status,
    required this.message,
    this.token,
  });
}
