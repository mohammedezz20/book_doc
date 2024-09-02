import '../../domain/entities/doctor.dart';

class DoctorDTO extends Doctor {
  DoctorDTO({
    super.id,
    super.createdAt,
    required super.name,
    required super.email,
    required super.imageUrl,
    required super.phoneNumber,
    required super.specialization,
    required super.address,
    required super.bio,
    required super.rating,
  });

  factory DoctorDTO.fromJson(Map<String, dynamic> json) {
    return DoctorDTO(
      id: json['id'],
      createdAt: json['createdAt'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      phoneNumber: json['phoneNumber'],
      specialization: json['specialization'],
      address: json['address'],
      bio: json['bio'],
      rating: json['rating'],
    );
  }
}
