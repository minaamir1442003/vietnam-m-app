import '../../../../core/common/result.dart';
import '../entity/forget_response_password_entity.dart';
import '../entity/reset_password_response_entity.dart';
import '../entity/verify_email_response_entity.dart';
import '../repository/auth_repository.dart';
import '../entity/sign_up_request.dart';
import '../entity/sign_up_response_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Result<SignUpResponseEntity>> execute(SignUpRequest request) {
    return _authRepository.signUp(request);
  }

  Future<Result<ForgetResponsePasswordEntity>> callForgetPassword(
    String email,
  ) async {
    return await _authRepository.forgetPassword(email);
  }
  Future<Result<VerifyOtpResponseEntity>> verifyOtp(
      VerifyOtpRequestEntity data,
      ) {
    return _authRepository.verifyOtp(data);
  }

  Future<Result<ResetPasswordResponseEntity>> callResetPassword(
   ResetPasswordRequestEntity data
  ) async {
    return await _authRepository.resetPassword(data);
  }
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity data,
      ) {
    return _authRepository.resetPassword(data);
  }

}
