class HomeTabResponseModel {
  HomeTabResponseModel({
      this.status, 
      this.message, 
      this.data,});

  HomeTabResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeDataModel.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  HomeDataModel? data;

}

class HomeDataModel {
  HomeDataModel({
      this.ads, 
      this.prizes,});

  HomeDataModel.fromJson(dynamic json) {
    if (json['ads'] != null) {
      ads = [];
      json['ads'].forEach((v) {
        ads?.add(AdsResponseModel.fromJson(v));
      });
    }
    if (json['prizes'] != null) {
      prizes = [];
      json['prizes'].forEach((v) {
        prizes?.add(PrizeResponseModel.fromJson(v));
      });
    }
  }
  List<AdsResponseModel>? ads;
  List<PrizeResponseModel>? prizes;


}

class PrizeResponseModel {
  PrizeResponseModel({
      this.id, 
      this.name, 
      this.image, 
      this.points, 
      this.minRole,});

  PrizeResponseModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    points = json['points_required'];
    minRole = json['min_role'];
  }
  num? id;
  String? name;
  String? image;
  num? points;
  String? minRole;

}

class AdsResponseModel {
  AdsResponseModel({
      this.id, 
      this.image,});

  AdsResponseModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  num? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }

}