class FindUsersResponseModel {
  final bool status;
  final String message;
  final FindUsersPaginationModel data;

  FindUsersResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FindUsersResponseModel.fromJson(Map<String, dynamic> json) {
    return FindUsersResponseModel(
      status: json['status'],
      message: json['message'],
      data: FindUsersPaginationModel.fromJson(json['data']),
    );
  }
}
class FindUsersPaginationModel {
  final int currentPage;
  final List<FindUserItemModel> users;
  final int lastPage;
  final int total;
  final String? nextPageUrl;

  FindUsersPaginationModel({
    required this.currentPage,
    required this.users,
    required this.lastPage,
    required this.total,
    required this.nextPageUrl,
  });

  factory FindUsersPaginationModel.fromJson(Map<String, dynamic> json) {
    return FindUsersPaginationModel(
      currentPage: json['current_page'],
      users: (json['data'] as List)
          .map((e) => FindUserItemModel.fromJson(e))
          .toList(),
      lastPage: json['last_page'],
      total: json['total'],
      nextPageUrl: json['next_page_url'],
    );
  }

  bool get hasMore => nextPageUrl != null;
}
class FindUserItemModel {
  final int id;
  final String name;
  final String phone;
  final String? image;

  FindUserItemModel({
    required this.id,
    required this.name,
    required this.phone,
    this.image,
  });

  factory FindUserItemModel.fromJson(Map<String, dynamic> json) {
    return FindUserItemModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
    );
  }
}
