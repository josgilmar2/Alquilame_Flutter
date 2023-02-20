class AllDwellingsResponse {
  late final List<Dwelling> content;
  late final int totalElements;
  late final int totalPages;
  late final int number;
  late final int size;

  AllDwellingsResponse(
      {required this.content,
      required this.totalElements,
      required this.totalPages,
      required this.number,
      required this.size});

  AllDwellingsResponse.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Dwelling>[];
      json['content'].forEach((v) {
        content.add(new Dwelling.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    number = json['number'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['number'] = this.number;
    data['size'] = this.size;
    return data;
  }
}

class Dwelling {
  late final int id;
  late final String name;
  late final String province;
  late final String image;
  late final double price;

  Dwelling(
      {required this.id,
      required this.name,
      required this.province,
      required this.image,
      required this.price});

  Dwelling.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    province = json['province'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province'] = this.province;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
