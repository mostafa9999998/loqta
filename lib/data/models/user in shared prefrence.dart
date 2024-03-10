
class SharedResponse {
  SharedResponse({
   required this.type,
   required this.userShared,});

  factory SharedResponse.fromJson(Map<String,dynamic> json) {
   return SharedResponse(
       type: json['type'],
       userShared: UserShared.fromJson(json['user'])
   );

    // type = json['type'];
    // userShared =  UserShared.fromJson(json['UserShared']) ;
  }
  late String type;
  late UserShared userShared;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['user'] = userShared.toJson();

    return map;
  }

}

class UserShared {
  UserShared({
   required this.id,
    required this.name,
    required this.email,
    required this.address,
    required  this.phonenum1,
    required this.phonenum2,
    required this.typeId,});

 factory UserShared.fromJson(Map<String,dynamic> json) {
   return UserShared(
    id : json['id'],
    name : json['name'],
    email : json['email'],
    address : json['address'],
    phonenum1 : json['phonenum1'],
    phonenum2 : json['phonenum2'],
    typeId : json['type_id']);

  }
  late int id;
  late String name;
  late String email;
  late String address;
  late String phonenum1;
  late String phonenum2;
  late int typeId;

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