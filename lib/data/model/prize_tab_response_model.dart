import 'package:project_one/data/model/home_tab_response_model.dart';

class PrizeTabResponseModel {
  PrizeTabResponseModel({this.status, this.message, this.data});

  PrizeTabResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PrizeResponseModel.fromJson(v));
      });
    }
  }

  bool? status;
  String? message;
  List<PrizeResponseModel>? data;
}

class ExchangePrizeResponseModel {
  bool? status;
  String? message;
  int? remainingPoints;

  ExchangePrizeResponseModel({this.status, this.message, this.remainingPoints});

  factory ExchangePrizeResponseModel.fromJson(Map<String, dynamic> json) {
    return ExchangePrizeResponseModel(
      status: json['status'],
      message: json['message'],
      remainingPoints: json['remaining_points'],
    );
  }
}
