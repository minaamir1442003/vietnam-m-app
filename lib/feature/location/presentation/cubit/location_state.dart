import '../../domain/entity/location_response_entity.dart';

abstract class LocationState {
  const LocationState();

}

class LocationInitial extends LocationState {
  const LocationInitial();
}

class LocationLoaded extends LocationState {
  final List<GovernorateEntity> governorates;

  const LocationLoaded(this.governorates);

  @override
  List<Object?> get props => [governorates];
}

class LocationError extends LocationState {
  final String message;
  const LocationError(this.message);

}
