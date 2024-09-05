import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../data_sources/appointment_firebase.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final appointmentFirebase = sl.get<AppointmentFirebase>();

  @override
  Future<String> addAppointment(AppointmentModel appointment) {
    return appointmentFirebase.addAppointment(appointment);
  }
}
