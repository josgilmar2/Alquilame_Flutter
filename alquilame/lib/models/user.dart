class UserResponse {
  String? id;
  String? username;
  String? avatar;
  String? fullName;
  String? address;
  String? email;
  String? phoneNumber;
  int? numPublications;
  String? createdAt;

  UserResponse(
      {this.id,
      this.username,
      this.avatar,
      this.fullName,
      this.address,
      this.email,
      this.phoneNumber,
      this.numPublications,
      this.createdAt});

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatar = json['avatar'];
    fullName = json['fullName'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    numPublications = json['numPublications'];
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
    data['numPublications'] = this.numPublications;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
