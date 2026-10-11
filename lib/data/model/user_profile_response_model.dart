


class UserProfileResponseModel {
  UserProfileResponseModel({
      this.status, 
      this.message, 
      this.data,});

  UserProfileResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataUserResponseModel.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  DataUserResponseModel? data;

}

class DataUserResponseModel {
  DataUserResponseModel({
      this.user,});

  DataUserResponseModel.fromJson(dynamic json) {
    user = json['user'] != null ? UserResponseModel.fromJson(json['user']) : null;
  }
  UserResponseModel? user;


}

class UserResponseModel {
  UserResponseModel({
      this.id, 
      this.firstname, 
      this.lastname, 
      this.email, 
      this.phone, 
      this.minRole, 
      this.points, 
      this.image, 
      this.state, 
      this.city, 
      this.address,});
  UserResponseModel copyWith({
    num? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? minRole,
    String? points,
    String? image,
    String? state,
    String? city,
    String? address,
  }) {
    return UserResponseModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      minRole: minRole ?? this.minRole,
      points: points ?? this.points,
      image: image ?? this.image,
      state: state ?? this.state,
      city: city ?? this.city,
      address: address ?? this.address,
    );
  }

  UserResponseModel.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    minRole = json['min_role'];
    points = json['points'];
    image = json['image'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
  }
  num? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? minRole;
  String? points;
  String? image;
  String? state;
  String? city;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['email'] = email;
    map['phone'] = phone;
    map['min_role'] = minRole;
    map['points'] = points;
    map['image'] = image;
    map['state'] = state;
    map['city'] = city;
    map['address'] = address;
    return map;
  }

}