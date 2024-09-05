import 'package:book_doc/features/home/domain/entities/doctor.dart';

class AppointmentModel {
  String id;
  final Doctor doctor;
  final String patientName;
  final String patientId;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String appointmentType;
  final String status;

  AppointmentModel({
    this.id = '',
    required this.doctor,
    required this.patientName,
    required this.patientId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentType,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor': doctor.toJson(),
      'patientName': patientName,
      'patientId': patientId,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'appointmentType': appointmentType,
      'status': status,
    };
  }
}
