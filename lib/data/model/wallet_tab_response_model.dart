class WalletPaginationModel {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final String? nextPageUrl;
  final String? prevPageUrl;

  WalletPaginationModel({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory WalletPaginationModel.fromJson(Map<String, dynamic> json) {
    return WalletPaginationModel(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      total: json['total'],
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
    );
  }
}
class WalletTransactionModel {
  final String id;
  final int originalId;
  final String type; // earn | spend
  final String description;
  final int points;
  final String date;
  final int timestamp;

  WalletTransactionModel({
    required this.id,
    required this.originalId,
    required this.type,
    required this.description,
    required this.points,
    required this.date,
    required this.timestamp,
  });

  bool get isEarn => type == 'earn';
  bool get isSpend => type == 'spend';

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) {
    return WalletTransactionModel(
      id: json['id'] as String,
      originalId: json['original_id'] as int,
      type: json['type'] as String,
      description: json['description'] as String,
      points: json['points'] as int,
      date: json['date'] as String,
      timestamp: json['timestamp'] as int,
    );
  }
}
class WalletDataModel {
  final String walletBalance;
  final List<WalletTransactionModel> transactions;
  final WalletPaginationModel pagination;

  WalletDataModel({
    required this.walletBalance,
    required this.transactions,
    required this.pagination,
  });

  factory WalletDataModel.fromJson(Map<String, dynamic> json) {
    return WalletDataModel(
      walletBalance: json['wallet_balance'],
      transactions: (json['transactions'] as List)
          .map((e) => WalletTransactionModel.fromJson(e))
          .toList(),
      pagination: WalletPaginationModel.fromJson(json['pagination']),
    );
  }
}
class WalletResponseModel {
  final bool status;
  final String message;
  final WalletDataModel data;

  WalletResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WalletResponseModel.fromJson(Map<String, dynamic> json) {
    return WalletResponseModel(
      status: json['status'],
      message: json['message'],
      data: WalletDataModel.fromJson(json['data']),
    );
  }
}
