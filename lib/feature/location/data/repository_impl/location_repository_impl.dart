import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../../../../core/network/api_execute.dart';
import '../../domain/entity/location_response_entity.dart';
import '../../domain/repository/location_reposiitory.dart';
import '../data_source/location_data_source.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remote;

  LocationRepositoryImpl(this.remote);

  @override
  Future<Result<List<GovernorateEntity>>> getLocations() async {
    return executeApi(() async {
      final result = await remote.getLocations();
      return result.map((e) => e.toEntity()).toList();
    });
  }
}
