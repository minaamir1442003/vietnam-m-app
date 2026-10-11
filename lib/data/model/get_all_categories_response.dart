class GetAllCategoriesResponse {
  GetAllCategoriesResponse({
      this.status, 
      this.message, 
      this.data,});

  GetAllCategoriesResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDataResponse.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<CategoryDataResponse>? data;


}

class CategoryDataResponse {
  CategoryDataResponse({
      this.id, 
      this.name, 
      this.image, 
      this.productsCount,});

  CategoryDataResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    productsCount = json['products_count'];
  }
  num? id;
  String? name;
  dynamic image;
  num? productsCount;


}