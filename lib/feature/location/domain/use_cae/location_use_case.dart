import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';
import 'package:project_one/feature/location/domain/entity/location_response_entity.dart';
import 'package:project_one/feature/location/domain/repository/location_reposiitory.dart';

@injectable
class LocationUseCase {
  final LocationRepository _repository;
  LocationUseCase(this._repository);
  Future<Result<List<GovernorateEntity>>> call()async{
    return await _repository.getLocations();
  }
}