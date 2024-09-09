import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../data_sources/appointment_firebase.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final appointmentFirebase = sl.get<AppointmentFirebase>();

  @override
  Future<String> addAppointment(AppointmentModel appointment) {
    return appointmentFirebase.addAppointment(appointment);
  }

  @override
  Future<Either<String, List<AppointmentModel>>> getAllAppointments() {
    return appointmentFirebase.getAllAppointments();
  }

  @override
  Future<String> updateAppointment(AppointmentModel appointment) {
    return appointmentFirebase.updateAppointment(appointment);
  }

  @override
  Future<String> updateAppointmentStatus(String appointmentId, String status) {
    return appointmentFirebase.updateAppointmentStatus(appointmentId, status);
  }
}
