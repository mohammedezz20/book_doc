import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../repositories/appointment_repository.dart';

class AppointmentUseCases {
  final appointmentRepository = sl.get<AppointmentRepository>();

  Future<String> addAppointment(AppointmentModel appointment) async {
    return await appointmentRepository.addAppointment(appointment);
  }

  Future<Either<String, List<AppointmentModel>>> getAllAppointments() async {
    return await appointmentRepository.getAllAppointments();
  }

  Future<String> updateAppointment(AppointmentModel appointment) async {
    return await appointmentRepository.updateAppointment(appointment);
  }

  Future<String> updateAppointmentStatus(
      String appointmentId, String status) async {
    return await appointmentRepository.updateAppointmentStatus(
        appointmentId, status);
  }
}
