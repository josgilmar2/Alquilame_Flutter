class OneDwellingResponse {
  late final int id;
  late final String name;
  late final String province;
  late final String image;
  late final double price;
  late final String address;
  late final String description;
  late final String type;
  late final double m2;
  late final int numBedrooms;
  late final int numBathrooms;
  late final bool hasElevator;
  late final bool hasPool;
  late final bool hasTerrace;
  late final bool hasGarage;
  late final Owner? owner;

  OneDwellingResponse(
      {required this.id,
      required this.name,
      required this.province,
      required this.image,
      required this.price,
      required this.address,
      required this.description,
      required this.type,
      required this.m2,
      required this.numBedrooms,
      required this.numBathrooms,
      required this.hasElevator,
      required this.hasPool,
      required this.hasTerrace,
      required this.hasGarage,
      required this.owner});

  OneDwellingResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    province = json['province'];
    image = json['image'];
    price = json['price'];
    address = json['address'];
    description = json['description'];
    type = json['type'];
    m2 = json['m2'];
    numBedrooms = json['numBedrooms'];
    numBathrooms = json['numBathrooms'];
    hasElevator = json['hasElevator'];
    hasPool = json['hasPool'];
    hasTerrace = json['hasTerrace'];
    hasGarage = json['hasGarage'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province'] = this.province;
    data['image'] = this.image;
    data['price'] = this.price;
    data['address'] = this.address;
    data['description'] = this.description;
    data['type'] = this.type;
    data['m2'] = this.m2;
    data['numBedrooms'] = this.numBedrooms;
    data['numBathrooms'] = this.numBathrooms;
    data['hasElevator'] = this.hasElevator;
    data['hasPool'] = this.hasPool;
    data['hasTerrace'] = this.hasTerrace;
    data['hasGarage'] = this.hasGarage;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Owner {
  String? username;
  String? fullName;
  String? email;
  String? phoneNumber;
  int? numPublications;

  Owner(
      {this.username,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.numPublications});

  Owner.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    numPublications = json['numPublications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['numPublications'] = this.numPublications;
    return data;
  }
}
