abstract class AppointmentStates {}

class AppointmentInitialState extends AppointmentStates {}

class AppointmentLoadingState extends AppointmentStates {}

class SelectAppointmentTypeState extends AppointmentStates {}

class ScrollToPreviousDateState extends AppointmentStates {}

class ScrollToNextDateState extends AppointmentStates {}

class SelectAppointmentDateState extends AppointmentStates {}

class SelectAppointmentTimeState extends AppointmentStates {}

class BookAppointmentSuccessState extends AppointmentStates {
  final String message;

  BookAppointmentSuccessState({required this.message});
}

class UpdateAppointmentSuccessState extends AppointmentStates {
  final String message;

  UpdateAppointmentSuccessState({required this.message});
}

class BookAppointmentErrorState extends AppointmentStates {
  final String error;

  BookAppointmentErrorState({required this.error});
}

class UpdateAppointmentErrorState extends AppointmentStates {
  final String error;

  UpdateAppointmentErrorState({required this.error});
}

class GetAllAppointmentsSuccessStateState extends AppointmentStates {}

class GetAllAppointmentsErrorStateState extends AppointmentStates {
  final String error;

  GetAllAppointmentsErrorStateState({required this.error});
}

class GetUpcomingAppointmentsSuccessStateState extends AppointmentStates {}

class GetUpcomingAppointmentsErrorStateState extends AppointmentStates {
  final String error;

  GetUpcomingAppointmentsErrorStateState({required this.error});
}

class GetCancelledAppointmentsSuccessStateState extends AppointmentStates {}

class GetCancelledAppointmentsErrorStateState extends AppointmentStates {
  final String error;

  GetCancelledAppointmentsErrorStateState({required this.error});
}

class GetCompletedAppointmentsSuccessStateState extends AppointmentStates {}

class GetCompletedAppointmentsErrorStateState extends AppointmentStates {
  final String error;

  GetCompletedAppointmentsErrorStateState({required this.error});
}

class UpdateAppointmentStatusErrorState extends AppointmentStates {
  final String error;

  UpdateAppointmentStatusErrorState({required this.error});
}

class UpdateAppointmentStatusSuccessState extends AppointmentStates {}

class AppointmentDateChangedState extends AppointmentStates {
  final DateTime newDate;

  AppointmentDateChangedState({required this.newDate});
}
