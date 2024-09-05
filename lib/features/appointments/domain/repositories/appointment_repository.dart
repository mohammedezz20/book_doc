import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';

abstract class AppointmentRepository {
  Future<String> addAppointment(AppointmentModel appointment);
}
