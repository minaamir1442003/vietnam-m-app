import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/data/repository/prize_tab_repository.dart';
import 'package:project_one/feature/layout/presentation/manager/prize_cubit/prize_tab_state.dart';

import '../../../../../core/common/result.dart';
import '../../../../../data/model/home_tab_response_model.dart';

@injectable
class PrizesViewModel extends Cubit<PrizesState> {
  final PrizeTabRepository repository;

  PrizesViewModel(this.repository) : super(PrizesInitial());

  List<PrizeResponseModel> prizes = [];

  Future<void> loadPrizes() async {
    emit(PrizesLoading());
    final result = await repository.getAllPrizes();
    switch (result) {
      case Success():
        prizes = result.data!;
        emit(PrizesLoaded(prizes));
      case Error():
        emit(PrizesError(result.message ?? 'Failed to load prizes'));
    }
  }

  Future<void> exchangePrize(int prizeId) async {
    emit(PrizeExchangeLoading(prizeId));

    final result = await repository.exchangePrize(prizeId);

    switch (result) {
      case Success():
        emit(
          PrizeExchangeSuccess(
            result.data!.message ?? '',
            remainingPoints: result.data!.remainingPoints,
          ),
        );
        emit(PrizesLoaded(prizes));
      case Error():
        emit(PrizeExchangeError(result.message ?? 'Exchange failed'));
        emit(PrizesLoaded(prizes));
    }
  }
}
