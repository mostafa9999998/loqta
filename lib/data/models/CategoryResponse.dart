class CategoryResponse {
  CategoryResponse({
      this.id, 
      this.name, 
      this.image, 
      this.fullSrc,});

  CategoryResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    fullSrc = json['full_src'];
  }
  int? id;
  String? name;
  String? image;
  String? fullSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['full_src'] = fullSrc;
    return map;
  }

}