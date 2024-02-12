
import 'dart:convert';

PetsResponse petsResponseFromJson(String str) => PetsResponse.fromJson(json.decode(str));

String petsResponseToJson(PetsResponse data) => json.encode(data.toJson());

class PetsResponse {
    final List<Pet> data;

    PetsResponse({
        required this.data,
    });

    factory PetsResponse.fromJson(Map<String, dynamic> json) => PetsResponse(
        data: List<Pet>.from(json["data"].map((x) => Pet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Pet {
    final int id;
    final String userName;
    final String petName;
    final String petImage;
    final bool isFriendly;

    Pet({
        required this.id,
        required this.userName,
        required this.petName,
        required this.petImage,
        required this.isFriendly,
    });

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        userName: json["userName"],
        petName: json["petName"],
        petImage: json["petImage"],
        isFriendly: json["isFriendly"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "petName": petName,
        "petImage": petImage,
        "isFriendly": isFriendly,
    };
}
