import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/sign_up_response_entity.dart';

part 'sign_up_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDTO extends SignUpResponseEntity {
  @override

  SignUpResponseDTO({required super.status,required super.message, super.token,super.errors});

  factory SignUpResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseDTOToJson(this);
  SignUpResponseEntity toEntity() {
    return SignUpResponseEntity(
      status: status,
      message: message,
      token: token,
      errors: errors,
    );
  }

}
