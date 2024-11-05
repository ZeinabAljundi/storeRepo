import 'dart:convert';

class Register {
  Data data;
  String message;

  Register({
    required this.data,
    required this.message,
  });

  factory Register.fromRawJson(String str) => Register.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  User user;
  FcmToken fcmToken;
  String accessToken;
  String tokenType;

  Data({
    required this.user,
    required this.fcmToken,
    required this.accessToken,
    required this.tokenType,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    fcmToken: FcmToken.fromJson(json["fcm_token"]),
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "fcm_token": fcmToken.toJson(),
    "access_token": accessToken,
    "token_type": tokenType,
  };
}

class FcmToken {
  String fcmToken;

  FcmToken({
    required this.fcmToken,
  });

  factory FcmToken.fromRawJson(String str) => FcmToken.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FcmToken.fromJson(Map<String, dynamic> json) => FcmToken(
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toJson() => {
    "fcm_token": fcmToken,
  };
}

class User {
  String name;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  User({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
