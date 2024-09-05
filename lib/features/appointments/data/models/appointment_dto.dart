import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';

import '../../../home/data/models/doctor_dto.dart';

class AppointmentDTO extends AppointmentModel {
  AppointmentDTO({
    super.id,
    required super.doctor,
    required super.appointmentDate,
    required super.appointmentTime,
    required super.appointmentType,
    required super.status,
    required super.patientName,
    required super.patientId,
  });

  factory AppointmentDTO.fromJson(Map<String, dynamic> json) {
    return AppointmentDTO(
      id: json['id'],
      doctor: DoctorDTO.fromJson(json['doctor']),
      appointmentDate: json['appointmentDate'],
      appointmentTime: json['appointmentTime'],
      appointmentType: json['appointmentType'],
      status: json['status'],
      patientName: json['patientName'],
      patientId: json['patientId'],
    );
  }
}
