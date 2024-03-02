class ProductsListResponse {
  ProductsListResponse({
      this.id, 
      this.name, 
      this.description, 
      this.primaryImage, 
      this.images, 
      this.color, 
      this.size, 
      this.price, 
      this.userId, 
      this.categoryId, 
      this.fullSrc, 
      this.fullSrc2,});

  ProductsListResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    primaryImage = json['primary_image'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    color = json['color'] != null ? json['color'].cast<String>() : [];
    size = json['size'] != null ? json['size'].cast<String>() : [];
    price = json['price'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    fullSrc = json['full_src'];
    fullSrc2 = json['full_src2'] != null ? json['full_src2'].cast<String>() : [];
  }
  int? id;
  String? name;
  String? description;
  String? primaryImage;
  List<String>? images;
  List<String>? color;
  List<String>? size;
  String? price;
  int? userId;
  int? categoryId;
  String? fullSrc;
  List<String>? fullSrc2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['primary_image'] = primaryImage;
    map['images'] = images;
    map['color'] = color;
    map['size'] = size;
    map['price'] = price;
    map['user_id'] = userId;
    map['category_id'] = categoryId;
    map['full_src'] = fullSrc;
    map['full_src2'] = fullSrc2;
    return map;
  }

}