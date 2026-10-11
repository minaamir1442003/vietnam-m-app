import '../../../../../data/model/home_tab_response_model.dart';

sealed class PrizesState {}

class PrizesInitial extends PrizesState {}

class PrizesLoading extends PrizesState {}

class PrizesLoaded extends PrizesState {
  final List<PrizeResponseModel> prizes;
  PrizesLoaded(this.prizes);
}

class PrizeExchangeLoading extends PrizesState {
  final int prizeId;
  PrizeExchangeLoading(this.prizeId);
}

class PrizeExchangeSuccess extends PrizesState {
  final String message;
  final int? remainingPoints;
  PrizeExchangeSuccess(this.message, {this.remainingPoints});
}

class PrizeExchangeError extends PrizesState {
  final String message;
  PrizeExchangeError(this.message);
}

class PrizesError extends PrizesState {
  final String message;
  PrizesError(this.message);
}
