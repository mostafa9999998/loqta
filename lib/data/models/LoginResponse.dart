class LoginResponse {
  LoginResponse({
      this.type, 
      this.user,});

  LoginResponse.fromJson(dynamic json) {
    type = json['type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? type;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
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
      this.phone, 
      this.typeId,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    typeId = json['type_id'];
  }
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  int? typeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['phone'] = phone;
    map['type_id'] = typeId;
    return map;
  }

}