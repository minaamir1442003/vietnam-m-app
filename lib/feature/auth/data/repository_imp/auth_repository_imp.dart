import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:project_one/core/service/shared_pref_helper.dart';
import 'package:project_one/core/utils/constant_manager.dart';
import 'package:project_one/feature/auth/domain/entity/forget_response_password_entity.dart';
import 'package:project_one/feature/auth/domain/entity/sign_in_response_entity.dart';

import '../../../../core/common/result.dart';
import '../../../../core/network/api_execute.dart';
import '../../domain/entity/reset_password_response_entity.dart';
import '../../domain/entity/sign_in_request.dart';
import '../../domain/entity/sign_up_request.dart';
import '../../domain/entity/sign_up_response_entity.dart';
import '../../domain/entity/verify_email_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Result<SignUpResponseEntity>> signUp(SignUpRequest data) async {
    return executeApi(() async {
      var result = await _authRemoteDataSource.signUp(data);
      await SharedPrefHelper.setSecureString(
        AppConstants.token,
        result.token.toString(),
      );
      return result.toEntity();
    });
  }

  @override
  Future<Result<SignInResponseEntity>> signIn(SignInRequest data) async {
    return executeApi(() {
      final result = _authRemoteDataSource.signIn(data);
      return result;
    });
  }

  @override
  Future<Result<ForgetResponsePasswordEntity>> forgetPassword(
    String email,
  ) async {
    return executeApi(() async {
      var res = await _authRemoteDataSource.forgetPassword(email);
      return res.toEntity();
    });
  }

  @override
  Future<Result<VerifyOtpResponseEntity>> verifyOtp(
    VerifyOtpRequestEntity data,
  ) async {
    return executeApi(() async {
      final response = await _authRemoteDataSource.verifyOtp(data);
      return response.toEntity();
    });
  }

  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity data,
  ) async {
    return executeApi(() async {
      final response = await _authRemoteDataSource.resetPassword(data);
      return response.toEntity();
    });
  }
}
