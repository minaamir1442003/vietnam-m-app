import '../../../../core/common/result.dart';
import '../entity/location_response_entity.dart';

abstract class LocationRepository {
  Future<Result<List<GovernorateEntity>>> getLocations();
}