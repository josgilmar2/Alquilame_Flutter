class AllDwellingsResponse {
  List<Dwelling>? content;
  int? totalElements;
  int? totalPages;
  int? number;
  int? size;

  AllDwellingsResponse(
      {this.content,
      this.totalElements,
      this.totalPages,
      this.number,
      this.size});

  AllDwellingsResponse.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Dwelling>[];
      json['content'].forEach((v) {
        content!.add(new Dwelling.fromJson(v));
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
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['number'] = this.number;
    data['size'] = this.size;
    return data;
  }
}

class Dwelling {
  int? id;
  String? name;
  String? province;
  String? image;
  double? price;

  Dwelling({this.id, this.name, this.province, this.image, this.price});

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
