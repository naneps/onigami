class UserModel {
  String? username;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? avatar;
  String? token;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? id;
  UserModel({
    this.id,
    this.username,
    this.name,
    this.avatar,
    this.phone,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    token = json['token'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  //tojson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['token'] = token;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
