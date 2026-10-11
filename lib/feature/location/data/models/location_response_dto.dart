import '../../domain/entity/location_response_entity.dart';
class LocationResponseDto {
  final bool status;
  final String message;
  final List<GovernorateDto> data;

  LocationResponseDto({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LocationResponseDto.fromJson(Map<String, dynamic> json) {
    return LocationResponseDto(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((e) => GovernorateDto.fromJson(e))
          .toList(),
    );
  }
}
class GovernorateDto {
  final int id;
  final String name;
  final List<CityDto> cities;

  GovernorateDto({
    required this.id,
    required this.name,
    required this.cities,
  });

  factory GovernorateDto.fromJson(Map<String, dynamic> json) {
    return GovernorateDto(
      id: json['id'],
      name: json['name'],
      cities: (json['cities'] as List)
          .map((e) => CityDto.fromJson(e))
          .toList(),
    );
  }

  GovernorateEntity toEntity() {
    return GovernorateEntity(
      id: id,
      name: name,
      cities: cities.map((e) => e.toEntity()).toList(),
    );
  }

}
class CityDto {
  final int id;
  final String name;
  final List<VillageDto> villages;

  CityDto({
    required this.id,
    required this.name,
    required this.villages,
  });

  factory CityDto.fromJson(Map<String, dynamic> json) {
    return CityDto(
      id: json['id'],
      name: json['name'],
      villages: (json['villages'] as List)
          .map((e) => VillageDto.fromJson(e))
          .toList(),
    );
  }

  CityEntity toEntity() {
    return CityEntity(
      id: id,
      name: name,
      villages: villages.map((e) => e.toEntity()).toList(),
    );
  }
}
class VillageDto {
  final int id;
  final String name;

  VillageDto({
    required this.id,
    required this.name,
  });

  factory VillageDto.fromJson(Map<String, dynamic> json) {
    return VillageDto(
      id: json['id'],
      name: json['name'],
    );
  }

  VillageEntity toEntity() {
    return VillageEntity(
      id: id,
      name: name,
    );
  }
}
