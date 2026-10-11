class RedeemCodeResponseModel {
  final bool? status;
  final String? message;
  final int? pointsAdded;
  final int? currentPoints;

  RedeemCodeResponseModel({
    this.status,
    this.message,
    this.pointsAdded,
    this.currentPoints,
  });

  factory RedeemCodeResponseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return RedeemCodeResponseModel(
      status: json['status'],
      message: json['message'],
      pointsAdded: json['points_added'],
      currentPoints: json['current_points'],
    );
  }
}
