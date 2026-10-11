import '../../../../../data/model/wallet_tab_response_model.dart';

class WalletState {
  final String balance;
  final List<WalletTransactionModel> transactions;

  final bool isLoading;
  final bool isLoadingMore;
  final String? errorMessage;

  final int currentPage;
  final bool hasMore;

  const WalletState({
    this.balance = '0',
    this.transactions = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.errorMessage,
    this.currentPage = 1,
    this.hasMore = true,
  });

  WalletState copyWith({
    String? balance,
    List<WalletTransactionModel>? transactions,
    bool? isLoading,
    bool? isLoadingMore,
    String? errorMessage,
    int? currentPage,
    bool? hasMore,
  }) {
    return WalletState(
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
