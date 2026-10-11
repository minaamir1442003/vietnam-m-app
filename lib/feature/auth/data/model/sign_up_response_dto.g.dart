// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseDTO _$SignUpResponseDTOFromJson(Map<String, dynamic> json) =>
    SignUpResponseDTO(
      status: json['status'] as bool,
      message: json['message'] as String,
      token: json['token'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$SignUpResponseDTOToJson(SignUpResponseDTO instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
    };
