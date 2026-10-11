import 'package:injectable/injectable.dart';
import 'package:project_one/core/network/api_execute.dart';

import '../../core/common/result.dart';
import '../data_source/find_users_tab_data_source.dart';
import '../model/find_users_response_model.dart';

abstract class FindUsersRepository {
  Future<Result<FindUsersPaginationModel>> findUsers({
    required String locationFilter,
    required int page,
  });
}

@Injectable(as: FindUsersRepository)
class FindUsersRepositoryImpl implements FindUsersRepository {
  final FindUsersRemoteDataSource remoteDataSource;

  FindUsersRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<FindUsersPaginationModel>> findUsers({
    required String locationFilter,
    required int page,
  }) async {
    return executeApi(() async {
      var response = await remoteDataSource.findUsers(
        locationFilter: locationFilter,
        page: page,
      );
      return response.data;
    });
  }
}
