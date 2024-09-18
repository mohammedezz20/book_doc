import 'dart:developer';

import 'package:book_doc/core/shared/global-variables.dart';
import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:book_doc/features/profile/domain/entities/user.dart';
import 'package:book_doc/features/profile/domain/use_cases/profile_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _profileUseCases = sl.get<ProfileUseCases>();

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
  List<AppointmentModel> appointmentsList = [];
  List<AppointmentModel> completedAppointmentsList = [];
  List<AppointmentModel> upcomingAppointmentsList = [];
  List<AppointmentModel> cancelledAppointmentsList = [];
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
  late MyUser user;

  Future<void> getUserData() async {
    final userResponse =
        await _profileUseCases.getUserById(GlobalVariables.user!.uid);
    userResponse.fold((l) => null, (r) {
      user = r;
    });
  }

  void bookAppointment() async {
    emit(AppointmentLoadingState());
    AppointmentModel appointment = AppointmentModel(
      appointmentDate: Timestamp.fromDate(appointmentDate),
      appointmentType: appointmentType,
      appointmentTime: appointmentTime,
      status: 'Appointment Upcoming',
      doctor: doctor,
      patient: user,
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

  getAllAppointments() async {
    var response = await _appointmentUseCases.getAllAppointments();
    response.fold((l) {
      log('Get All Appointments Error: $l');
      emit(GetAllAppointmentsErrorStateState(error: l));
    }, (r) {
      appointmentsList = r;
      upcomingAppointmentsList =
          r.where((e) => e.status == 'Appointment Upcoming').toList();
      completedAppointmentsList =
          r.where((e) => e.status == 'Appointment Completed').toList();
      cancelledAppointmentsList =
          r.where((e) => e.status == 'Appointment Cancelled').toList();
      log('Get All Appointments Success: $r');
      emit(GetAllAppointmentsSuccessStateState());
    });
  }

  getUpcomingAppointments() async {
    emit(AppointmentLoadingState());
    var response = await _appointmentUseCases.getAllAppointments();
    response.fold((l) {
      emit(GetUpcomingAppointmentsErrorStateState(error: l));
    }, (r) {
      upcomingAppointmentsList =
          r.where((e) => e.status == 'Appointment Upcoming').toList();
      emit(GetUpcomingAppointmentsSuccessStateState());
    });
  }

  getCompletedAppointments() async {
    emit(AppointmentLoadingState());
    var response = await _appointmentUseCases.getAllAppointments();
    response.fold((l) {
      emit(GetCompletedAppointmentsErrorStateState(error: l));
    }, (r) {
      completedAppointmentsList =
          r.where((e) => e.status == 'Appointment Completed').toList();
      emit(GetCompletedAppointmentsSuccessStateState());
    });
  }

  getCancelledAppointments() async {
    emit(AppointmentLoadingState());
    var response = await _appointmentUseCases.getAllAppointments();
    response.fold((l) {
      emit(GetCancelledAppointmentsErrorStateState(error: l));
    }, (r) {
      cancelledAppointmentsList =
          r.where((e) => e.status == 'Appointment Cancelled').toList();
      emit(GetCancelledAppointmentsSuccessStateState());
    });
  }

  updateAppointmentStatus({required String id, required String status}) async {
    var response =
        await _appointmentUseCases.updateAppointmentStatus(id, status);
    if (response == 'success') {
      emit(UpdateAppointmentStatusSuccessState());
    } else {
      emit(UpdateAppointmentStatusErrorState(error: response));
    }
  }

  updateAppointment(AppointmentModel appointment) async {
    emit(AppointmentLoadingState());
    String response = await _appointmentUseCases.updateAppointment(appointment);
    if (response == 'success') {
      init();
      emit(
        UpdateAppointmentSuccessState(
          message: 'Appointment updated Successfully',
        ),
      );
    } else {
      log('Update Appointment Error: $response');
      emit(UpdateAppointmentErrorState(error: response));
    }
  }

  void setAppointmentDate(DateTime selectedDate) {
    appointmentDate = selectedDate;
    emit(AppointmentDateChangedState(newDate: appointmentDate));
  }

  init() {
    appointmentTime = '';
    appointmentType = '';
    appointmentDate = DateTime.now();
  }
}
