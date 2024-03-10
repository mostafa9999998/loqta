class UpdateResponse {
  UpdateResponse({
      this.message, 
      this.user,});

  UpdateResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.address, 
      this.phonenum1, 
      this.phonenum2, 
      this.typeId,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phonenum1 = json['phonenum1'];
    phonenum2 = json['phonenum2'];
    typeId = json['type_id'];
  }
  int? id;
  String? name;
  String? email;
  String? address;
  String? phonenum1;
  String? phonenum2;
  int? typeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['phonenum1'] = phonenum1;
    map['phonenum2'] = phonenum2;
    map['type_id'] = typeId;
    return map;
  }

}