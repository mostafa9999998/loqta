class UpdateBody {
  UpdateBody({
      this.name, 
      this.password, 
      this.phonenum1, 
      this.phonenum2, 
      this.address,});

  UpdateBody.fromJson(dynamic json) {
    name = json['name'];
    password = json['password'];
    phonenum1 = json['phonenum1'];
    phonenum2 = json['phonenum2'];
    address = json['address'];
  }
  String? name;
  String? password;
  String? phonenum1;
  String? phonenum2;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['password'] = password;
    map['phonenum1'] = phonenum1;
    map['phonenum2'] = phonenum2;
    map['address'] = address;
    return map;
  }

}