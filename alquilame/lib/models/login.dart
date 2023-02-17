class LoginResponse {
  String? id;
  String? username;
  String? avatar;
  String? fullName;
  String? address;
  String? email;
  String? phoneNumber;
  int? numPublications;
  String? createdAt;
  String? role;
  String? token;

  LoginResponse(
      {this.id,
      this.username,
      this.avatar,
      this.fullName,
      this.address,
      this.email,
      this.phoneNumber,
      this.numPublications,
      this.createdAt,
      this.role,
      this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatar = json['avatar'];
    fullName = json['fullName'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    numPublications = json['numPublications'];
    createdAt = json['createdAt'];
    role = json['role'];
    token = json['token'];
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
    data['numPublications'] = this.numPublications;
    data['createdAt'] = this.createdAt;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}

class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
