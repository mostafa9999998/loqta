class OrderBody {
  OrderBody({
      this.usersId, 
      this.productId, 
      this.quantity, 
      this.price, 
      this.color, 
      this.size,});

  OrderBody.fromJson(dynamic json) {
    usersId = json['users_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    color = json['color'];
    size = json['size'];
  }
  String? usersId;
  String? productId;
  String? quantity;
  String? price;
  String? color;
  String? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['users_id'] = usersId;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['color'] = color;
    map['size'] = size;
    return map;
  }

}