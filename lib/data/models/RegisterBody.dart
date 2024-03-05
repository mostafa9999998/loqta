class RegisterBody {
  RegisterBody({
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      this.address,});

  RegisterBody.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
  }
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['address'] = address;
    return map;
  }

}