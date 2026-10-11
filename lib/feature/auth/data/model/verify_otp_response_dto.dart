import '../../domain/entity/verify_email_response_entity.dart';

class VerifyOtpResponseDto extends VerifyOtpResponseEntity {
  VerifyOtpResponseDto({
    super.status,
    super.message,
  });

  factory VerifyOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseDto(
      status: json['status'],
      message: json['message'],
    );
  }

  VerifyOtpResponseEntity toEntity() {
    return VerifyOtpResponseEntity(
      status: status,
      message: message,
    );
  }
}
