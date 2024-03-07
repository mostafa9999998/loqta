class OfferPicResponse {
  OfferPicResponse({
      this.id, 
      this.image, 
      this.categoryId, 
      this.fullSrc,});

  OfferPicResponse.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    categoryId = json['category_id'];
    fullSrc = json['full_src'];
  }
  int? id;
  String? image;
  int? categoryId;
  String? fullSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['category_id'] = categoryId;
    map['full_src'] = fullSrc;
    return map;
  }

}