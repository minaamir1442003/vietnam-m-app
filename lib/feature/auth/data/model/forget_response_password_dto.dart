import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/forget_response_password_entity.dart';

@JsonSerializable()
class ForgetResponsePasswordDto extends ForgetResponsePasswordEntity {
  ForgetResponsePasswordDto({ super.message,  super.status});
  factory ForgetResponsePasswordDto.fromJson(Map<String, dynamic> json) {
    return ForgetResponsePasswordDto(
      status: json['status'],
      message: json['message'],
    );
  }

  ForgetResponsePasswordEntity toEntity() {
    return ForgetResponsePasswordEntity(
      status: status,
      message: message,
    );
  }
}
