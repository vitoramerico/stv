import 'dart:convert';

class UserTokenModel {
    bool success;
    String accessToken;
    int statusCode;
    String statusMessage;
    String accountId;
    String sessionId;

    UserTokenModel({
        this.success,
        this.accessToken,
        this.statusCode,
        this.statusMessage,
        this.accountId,
        this.sessionId,
    });

    factory UserTokenModel.fromJson(String str) => UserTokenModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserTokenModel.fromMap(Map<String, dynamic> json) => UserTokenModel(
        success: json["success"],
        accessToken: json["access_token"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        accountId: json["account_id"],
        sessionId: json["session_id"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "access_token": accessToken,
        "status_code": statusCode,
        "status_message": statusMessage,
        "account_id": accountId,
        "session_id": sessionId,
    };
}