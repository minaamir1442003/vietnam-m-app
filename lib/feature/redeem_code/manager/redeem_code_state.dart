class RedeemCodeState {
  final String code;
  final bool isLoading;
  final bool isSuccess;
  final bool isScanning;
  final String? errorMessage;

  final int? pointsAdded;
  final int? currentPoints;

  const RedeemCodeState({
    this.code = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.isScanning = false,
    this.errorMessage,
    this.pointsAdded,
    this.currentPoints,
  });

  bool get canRedeem => code.isNotEmpty && !isLoading;

  RedeemCodeState copyWith({
    String? code,
    bool? isLoading,
    bool? isSuccess,
    bool? isScanning,
    String? errorMessage,
    int? pointsAdded,
    int? currentPoints,
  }) {
    return RedeemCodeState(
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isScanning: isScanning ?? this.isScanning,
      errorMessage: errorMessage,
      pointsAdded: pointsAdded ?? this.pointsAdded,
      currentPoints:
      currentPoints ?? this.currentPoints,
    );
  }
}
