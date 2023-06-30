import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    Payload payload;

    UserModel({
        required this.payload,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "payload": payload.toJson(),
    };
}

class Payload {
    User user;
    Token token;

    Payload({
        required this.user,
        required this.token,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        user: User.fromJson(json["user"]),
        token: Token.fromJson(json["token"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token.toJson(),
    };
}

class Token {
    String accessToken;
    String refreshToken;

    Token({
        required this.accessToken,
        required this.refreshToken,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}

class User {
    String email;
    String username;
    int? id;
    int? exp;

    User({
        required this.email,
        required this.username,
        this.id,
        this.exp,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        id: json["id"],
        exp: json["exp"],
    );

    factory User.fromJon(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        id: json["id"],
        exp: json["exp"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "id": id,
        "exp": exp,
    };
}
