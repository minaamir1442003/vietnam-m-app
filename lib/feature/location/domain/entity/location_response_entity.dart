class GovernorateEntity {
  final int id;
  final String name;
  final List<CityEntity> cities;

  GovernorateEntity({
    required this.id,
    required this.name,
    required this.cities,
  });
}
class CityEntity {
  final int id;
  final String name;
  final List<VillageEntity> villages;

  CityEntity({
    required this.id,
    required this.name,
    required this.villages,
  });
}
class VillageEntity {
  final int id;
  final String name;

  VillageEntity({
    required this.id,
    required this.name,
  });
}
