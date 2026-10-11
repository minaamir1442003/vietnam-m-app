
class SignUpResponseEntity {
  final bool status;
  final String message;
  final String? token;
  final Map<String, List<String>>? errors;

  SignUpResponseEntity({
    required this.status,
    required this.message,
    this.token,
    this.errors,
  });
}
