import 'dart:developer';

import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../home/domain/entities/doctor.dart';
import '../../../domain/use_cases/appointment_useCases.dart';
import '../../pages/appointment_screen/widgets/appointment_type_picker.dart';
import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentStates> {
  AppointmentCubit() : super(AppointmentInitialState());

  static AppointmentCubit get(context) => BlocProvider.of(context);
  final _appointmentUseCases = sl.get<AppointmentUseCases>();

  final List<AppointmentType> appointmentTypes = [
    AppointmentType(
      icon: Icons.person_outline,
      color: Colors.lightBlueAccent,
      text: 'In Person',
    ),
    AppointmentType(
      icon: Icons.videocam_outlined,
      text: 'Video Call',
      color: Colors.lightGreen,
    ),
    AppointmentType(
      icon: Icons.phone_in_talk_outlined,
      text: 'Phone Call',
      color: Colors.red,
    ),
  ];
  final List<String> availableTimes = [
    '08.00 AM',
    '08.30 AM',
    '09.00 AM',
    '09.30 AM',
    '10.00 AM',
    '10.30 AM',
    '11.00 AM'
  ];
  String appointmentType = 'In Person';
  DateTime appointmentDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  String appointmentTime = '8:00 AM';

  void selectAppointmentType(String type) {
    appointmentType = type;
    log('Selected Appointment Type: $appointmentType');
    emit(SelectAppointmentTypeState());
  }

  void scrollToPreviousDate() {
    if (appointmentDate
        .isAfter(currentDate.subtract(const Duration(days: 30)))) {
      appointmentDate = appointmentDate.subtract(const Duration(days: 1));
      log('Appointment Date Changed to: $appointmentDate');
      emit(ScrollToPreviousDateState());
    }
  }

  void scrollToNextDate() {
    if (appointmentDate.isBefore(currentDate.add(const Duration(days: 30)))) {
      appointmentDate = appointmentDate.add(const Duration(days: 1));
      log('Appointment Date Changed to: $appointmentDate');
      emit(ScrollToNextDateState());
    }
  }

  void selectAppointmentDate(DateTime date) {
    appointmentDate = date;
    log('Selected Appointment Date: $appointmentDate');
    emit(SelectAppointmentDateState());
  }

  void selectAppointmentTime(String availableTime) {
    appointmentTime = availableTime;
    log('Selected Appointment Time: $appointmentTime');
    emit(SelectAppointmentTimeState());
  }

  late Doctor doctor;

  void bookAppointment() async {
    emit(AppointmentLoadingState());
    AppointmentModel appointment = AppointmentModel(
      appointmentDate: appointmentDate,
      appointmentType: appointmentType,
      appointmentTime: appointmentTime,
      status: 'Appointment Pending',
      doctor: doctor,
      patientName: FirebaseAuth.instance.currentUser!.displayName!,
      patientId: FirebaseAuth.instance.currentUser!.uid,
    );
    String response = await _appointmentUseCases.addAppointment(appointment);
    if (response == 'success') {
      init();
      emit(
        BookAppointmentSuccessState(
          message: 'Appointment Added Successfully',
        ),
      );
    } else {
      log('Book Appointment Error: $response');
      emit(BookAppointmentErrorState(error: response));
    }
  }

  init() {
    appointmentTime = '';
    appointmentType = '';
    appointmentDate = DateTime.now();
  }
}
