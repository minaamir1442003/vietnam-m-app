import 'package:injectable/injectable.dart';
import 'package:project_one/feature/auth/domain/entity/sign_in_response_entity.dart';

import '../../../../core/common/result.dart';
import '../entity/sign_in_request.dart';
import '../repository/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Result<SignInResponseEntity>> execute(SignInRequest data) {
    return _authRepository.signIn(data);
  }
}
