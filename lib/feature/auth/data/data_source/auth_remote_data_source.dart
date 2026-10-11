import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/feature/auth/data/model/sign_in_response_dto.dart';
import 'package:project_one/feature/auth/domain/entity/reset_password_response_entity.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/service/shared_pref_helper.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../domain/entity/sign_in_request.dart';
import '../../domain/entity/sign_up_request.dart';
import '../../domain/entity/verify_email_response_entity.dart';
import '../model/forget_response_password_dto.dart';
import '../model/reset_password_dto.dart';
import '../model/sign_up_response_dto.dart';
import '../model/verify_otp_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpResponseDTO> signUp(SignUpRequest data);

  Future<SignInResponseDTO> signIn(SignInRequest data);

  Future<ForgetResponsePasswordDto> forgetPassword(String email);

  Future<VerifyOtpResponseDto> verifyOtp(VerifyOtpRequestEntity data);

  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestEntity data,
  );
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._apiClient, this._dio);

  @override
  Future<SignUpResponseDTO> signUp(SignUpRequest data) async {
    log("Sign-up request data: ${data.toMap()}");

    final formData = FormData.fromMap({
      'firstname': data.firstName,
      'lastname': data.lastName,
      'email': data.email,
      'password': data.password,
      'password_confirmation': data.passwordConfirmation,
      'phone': data.phone,
      'type': data.type.value,
      'governorate_id': data.governorateId,
      'city_id': data.cityId,
      'village_id': data.villageId,
      if (data.imagePath != null)
        'image': await MultipartFile.fromFile(
          data.imagePath!,
          filename: data.imagePath!.split('/').last,
        ),
    });
    final lang = await SharedPrefHelper.getString('languageCode') ?? 'en';
    final response = await _dio.post(
      '${AppConstants.baseUrl}/api/v1/register',
      data: formData,

      options: Options(
        contentType: 'multipart/form-data',
        headers: {'Accept': 'application/json', 'Accept-Language': lang},
      ),
    );

    return SignUpResponseDTO.fromJson(response.data);
  }

  @override
  Future<SignInResponseDTO> signIn(SignInRequest data) async {
    var response = await _apiClient.signIn(data);
    return response;
  }

  @override
  Future<ForgetResponsePasswordDto> forgetPassword(String email) async {
    final response = await _apiClient.forgetPassword({"email": email});
    return response;
  }

  @override
  Future<VerifyOtpResponseDto> verifyOtp(VerifyOtpRequestEntity data) async {
    final response = await _apiClient.verifyOtp(data.toMap());
    return response;
  }

  @override
  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestEntity data,
  ) async {
    final response = await _dio.post(
      "${AppConstants.baseUrl}/api/v1/reset-password",
      data: {
        "email": data.email,
        "otp": data.otp,
        "password": data.password,
        "password_confirmation": data.passwordConfirmation,
      },
    );
    return ResetPasswordResponseDto.fromJson(response.data);
  }
}
