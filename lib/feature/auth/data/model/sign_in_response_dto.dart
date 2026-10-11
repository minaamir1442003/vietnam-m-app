import 'package:json_annotation/json_annotation.dart';
import 'package:project_one/feature/auth/domain/entity/sign_in_response_entity.dart';


part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDTO extends SignInResponseEntity{
  @override
  SignInResponseDTO({
    required super.status,
    required super.message,
    super.token,
  });
  factory SignInResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDTOToJson(this);

  SignInResponseEntity toEntity() {
    return SignInResponseEntity(
      status: status,
      message: message,
      token: token,
    );
  }
}
