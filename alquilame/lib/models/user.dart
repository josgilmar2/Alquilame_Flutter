import 'package:alquilame/models/login.dart';

class UserResponse {
  String? id;
  String? username;
  String? avatar;
  String? fullName;
  String? address;
  String? email;
  String? phoneNumber;
  String? role;
  int? numPublications;
  int? numLiked;
  String? createdAt;

  UserResponse(
      {this.id,
      this.username,
      this.avatar,
      this.fullName,
      this.address,
      this.email,
      this.phoneNumber,
      this.role,
      this.numPublications,
      this.numLiked,
      this.createdAt});

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatar = json['avatar'];
    fullName = json['fullName'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    numPublications = json['numPublications'];
    numLiked = json['numLiked'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['fullName'] = this.fullName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    data['numPublications'] = this.numPublications;
    data['numLiked'] = this.numLiked;
    data['createdAt'] = this.createdAt;
    return data;
  }

  UserResponse.fromLoginResponse(LoginResponse response) {
    this.id = response.id;
    this.username = response.username;
    this.avatar = response.avatar;
    this.fullName = response.fullName;
    this.address = response.address;
    this.email = response.email;
    this.phoneNumber = response.phoneNumber;
    this.numPublications = response.numPublications;
  }
}
