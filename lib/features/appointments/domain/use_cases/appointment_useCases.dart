import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';

import '../../../../core/di/service_locator.dart';
import '../repositories/appointment_repository.dart';

class AppointmentUseCases {
  final appointmentRepository = sl.get<AppointmentRepository>();

  Future<String> addAppointment(AppointmentModel appointment) async {
    return await appointmentRepository.addAppointment(appointment);
  }
}
