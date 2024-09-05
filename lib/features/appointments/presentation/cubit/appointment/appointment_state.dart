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

class BookAppointmentErrorState extends AppointmentStates {
  final String error;

  BookAppointmentErrorState({required this.error});
}
