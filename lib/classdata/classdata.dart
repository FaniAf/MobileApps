import 'dart:convert';

Cdata cdataFromJson(String str) => Cdata.fromJson(json.decode(str));

String cdataToJson(Cdata data) => json.encode(data.toJson());

class Cdata {
  Cdata({
    this.id,
    required this.firstName,
    required this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    required this.email,
    required this.phone,
    this.username,
    this.password,
    required this.birthDate,
    required this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  DateTime birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  String? eyeColor;

  factory Cdata.fromJson(Map<String, dynamic> json) => Cdata(
        id: json["id"] ?? 0,
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        maidenName: json["maidenName"] ?? '',
        age: json["age"] ?? 0,
        gender: json["gender"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        username: json["username"] ?? '',
        password: json["password"] ?? '',
        birthDate: DateTime.parse(json["birthDate"]),
        image: json["image"] ?? '',
        bloodGroup: json["bloodGroup"] ?? '',
        height: json["height"] ?? 0,
        weight: json["weight"].toDouble(),
        eyeColor: json["eyeColor"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": birthDate.year.toString(),
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
      };
}
