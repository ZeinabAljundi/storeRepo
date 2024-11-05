import 'dart:convert';

class User {
  Data data;
  String message;

  User({
    required this.data,
    required this.message,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  UserClass user;
  String accessToken;
  String tokenType;

  Data({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: UserClass.fromJson(json["user"]),
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "access_token": accessToken,
    "token_type": tokenType,
  };
}

class UserClass {
  String name;
  String email;
  String fcmToken;

  UserClass({
    required this.name,
    required this.email,
    required this.fcmToken,
  });

  factory UserClass.fromRawJson(String str) => UserClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    name: json["name"],
    email: json["email"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "fcm_token": fcmToken,
  };
}
