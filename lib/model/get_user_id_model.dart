// To parse this JSON data, do
//
//     final getUserIdModel = getUserIdModelFromJson(jsonString);

import 'dart:convert';

List<GetUserIdModel> getUserIdModelFromJson(String str) => List<GetUserIdModel>.from(json.decode(str).map((x) => GetUserIdModel.fromJson(x)));

String getUserIdModelToJson(List<GetUserIdModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUserIdModel {
    int id;
    DateTime dateCreated;
    DateTime dateCreatedGmt;
    DateTime dateModified;
    DateTime dateModifiedGmt;
    String email;
    String firstName;
    String lastName;
    String role;
    String username;
    Ing billing;
    Ing shipping;
    bool isPayingCustomer;

    GetUserIdModel({
        required this.id,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.role,
        required this.username,
        required this.billing,
        required this.shipping,
        required this.isPayingCustomer,
    });

    factory GetUserIdModel.fromJson(Map<String, dynamic> json) => GetUserIdModel(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        username: json["username"],
        billing: Ing.fromJson(json["billing"]),
        shipping: Ing.fromJson(json["shipping"]),
        isPayingCustomer: json["is_paying_customer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "username": username,
        "billing": billing.toJson(),
        "shipping": shipping.toJson(),
        "is_paying_customer": isPayingCustomer,
    };
}

class Ing {
    String firstName;
    String lastName;
    String company;
    String address1;
    String address2;
    String city;
    String postcode;
    String country;
    String state;
    String? email;
    String phone;

    Ing({
        required this.firstName,
        required this.lastName,
        required this.company,
        required this.address1,
        required this.address2,
        required this.city,
        required this.postcode,
        required this.country,
        required this.state,
        this.email,
        required this.phone,
    });

    factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        postcode: json["postcode"],
        country: json["country"],
        state: json["state"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "postcode": postcode,
        "country": country,
        "state": state,
        "email": email,
        "phone": phone,
    };
}
