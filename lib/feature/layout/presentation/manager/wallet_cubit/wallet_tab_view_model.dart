import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/data/repository/wallet_tab_repository.dart';
import 'package:project_one/feature/layout/presentation/manager/wallet_cubit/wallet_tab_state.dart';

import '../../../../../core/common/result.dart';

@injectable
class WalletCubit extends Cubit<WalletState> {
  final WalletTabRepository repository;

  WalletCubit(this.repository) : super(const WalletState());

  Future<void> loadWallet({bool refresh = false}) async {
    if (state.isLoading) return;

    if (!refresh && state.transactions.isNotEmpty) return;

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        currentPage: 1,
        hasMore: true,
        transactions: refresh ? [] : state.transactions,
      ),
    );

    final result = await repository.getWalletData( 1);

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoading: false,
            balance: result.data!.walletBalance,
            transactions: result.data!.transactions,
            currentPage: 1,
            hasMore: result.data!.pagination.nextPageUrl != null,
          ),
        );
        break;

      case Error():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: result.message,
          ),
        );
        break;
    }
  }
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;

    final result = await repository.getWalletData( nextPage);

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoadingMore: false,
            transactions: [
              ...state.transactions,
              ...result.data!.transactions,
            ],
            currentPage: nextPage,
            hasMore: result.data!.pagination.nextPageUrl != null,
          ),
        );
        break;

      case Error():
        emit(
          state.copyWith(
            isLoadingMore: false,
            errorMessage: result.message,
          ),
        );
        break;
    }
  }

  void clear() {
    emit(const WalletState());
  }
}
