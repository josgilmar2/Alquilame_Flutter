class EditPasswordRequest {
  String? oldPassword;
  String? newPassword;
  String? verifyNewPassword;

  EditPasswordRequest(
      {this.oldPassword, this.newPassword, this.verifyNewPassword});

  EditPasswordRequest.fromJson(Map<String, dynamic> json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    verifyNewPassword = json['verifyNewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oldPassword'] = this.oldPassword;
    data['newPassword'] = this.newPassword;
    data['verifyNewPassword'] = this.verifyNewPassword;
    return data;
  }
}

class EditProfileRequest {
  String? fullName;
  String? address;
  String? phoneNumber;

  EditProfileRequest({this.fullName, this.address, this.phoneNumber});

  EditProfileRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
