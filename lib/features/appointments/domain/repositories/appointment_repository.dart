import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentRepository {
  Future<String> addAppointment(AppointmentModel appointment);

  Future<Either<String, List<AppointmentModel>>> getAllAppointments();

  Future<String> updateAppointment(AppointmentModel appointment);

  Future<String> updateAppointmentStatus(String appointmentId, String status);
}
