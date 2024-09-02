import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String? id;
  String? name;
  String? email;
  String? imageUrl;
  String? phoneNumber;
  String? specialization;
  String? address;
  String? bio;
  num? rating;
  Timestamp? createdAt;

  Doctor({
    this.id = '',
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
    required this.specialization,
    required this.address,
    required this.bio,
    required this.rating,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
        'phoneNumber': phoneNumber,
        'specialization': specialization,
        'address': address,
        'bio': bio,
        'rating': rating,
        'createdAt': createdAt,
      };
}
