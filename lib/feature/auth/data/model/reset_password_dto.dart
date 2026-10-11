import '../../domain/entity/reset_password_response_entity.dart';

class ResetPasswordResponseDto extends ResetPasswordResponseEntity {
  ResetPasswordResponseDto({
    super.status,
    super.message,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseDto(
      status: json['status'],
      message: json['message'],
    );
  }

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(
      status: status,
      message: message,
    );
  }
}
