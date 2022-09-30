
import 'dart:convert';

class ResponseModel {
    ResponseModel({
        this.success,
        this.messageEn,
        this.messageAr,
        this.data,
        this.statusCode,
    });

    bool? success;
    String? messageEn;
    String? messageAr;
    dynamic data;
    int? statusCode;

    factory ResponseModel.fromRawJson(String str) => ResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        success: json["Success"],
        messageEn: json["MessageEN"],
        messageAr: json["MessageAR"],
        data: json["Data"],
        statusCode: json["StatusCode"],
    );

    Map<String, dynamic> toJson() => {
        "Success": success,
        "MessageEN": messageEn,
        "MessageAR": messageAr,
        "Data": data,
        "StatusCode": statusCode,
    };
}
