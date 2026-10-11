import 'package:injectable/injectable.dart';

import '../../../../core/network/api_client.dart';
import '../models/location_response_dto.dart';

abstract class LocationRemoteDataSource {
  Future<List<GovernorateDto>> getLocations();
}

@Injectable(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final ApiClient apiClient;

  LocationRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<GovernorateDto>> getLocations() async {
    final response = await apiClient.getLocation();
   return response.data;
    // return list.map((e) => GovernorateDto.fromJson(e)).toList();
  }
}
