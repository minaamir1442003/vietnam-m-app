import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../../domain/entity/location_response_entity.dart';
import '../../domain/use_cae/location_use_case.dart';
import 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final LocationUseCase _useCase;

  LocationCubit(this._useCase) : super(const LocationInitial());

  List<GovernorateEntity> governorates = [];

  Future<void> loadLocationsOnce() async {
    if (governorates.isNotEmpty) return;

    final result = await _useCase.call();

    switch (result) {
      case Success():
        governorates = result.data!;
        emit(LocationLoaded(governorates));
        break;
      case Error():
        emit(LocationError(result.message ?? 'Location error'));
    }
  }
}
