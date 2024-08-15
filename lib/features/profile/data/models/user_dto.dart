import 'package:book_doc/features/profile/domain/entities/user.dart';

class MyUserDTO extends MyUser {
  MyUserDTO({
    required super.fullName,
    required super.email,
    required super.password,
    required super.phone,
    required super.age,
    required super.gender,
    required super.address,
    required super.imageUrl,
  });

  factory MyUserDTO.fromJson(Map<String, dynamic> json) {
    return MyUserDTO(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      age: json['age'],
      gender: json['gender'],
      address: json['address'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'age': age,
      'gender': gender,
      'address': address,
      'imageUrl': imageUrl,
    };
  }
}
