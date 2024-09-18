import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/shared/global-variables.dart';
import '../../domain/entities/appointment_model.dart';
import '../models/appointment_dto.dart';

abstract class AppointmentFirebase {
  Future<String> addAppointment(AppointmentModel appointment);

  Future<Either<String, List<AppointmentModel>>> getAllAppointments();

  Future<String> updateAppointment(AppointmentModel appointment);

  Future<String> updateAppointmentStatus(String appointmentId, String status);
}

class AppointmentFirebaseImpl implements AppointmentFirebase {
  @override
  Future<String> addAppointment(AppointmentModel appointment) async {
    try {
      Map<String, dynamic> appointmentData = appointment.toJson();
      DocumentReference docRef = await FirebaseFirestore.instance
          .collection('appointments')
          .add(appointmentData);
      String documentId = docRef.id;
      await docRef.update({'id': documentId});
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<String, List<AppointmentModel>>> getAllAppointments() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('appointments')
              .where('patient.id', isEqualTo: GlobalVariables.user!.uid)
              .orderBy('appointmentDate')
              .orderBy('appointmentTime')
              .get();
      List<AppointmentModel> appointments = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return AppointmentDTO.fromJson(data);
      }).toList();
      return Right(appointments);
    } on FirebaseException catch (e) {
      log('Firebase Exception: ${e.message}', error: e);
      return Left('Failed to fetch appointments: ${e.message}');
    } catch (e) {
      log('General Exception: $e', error: e);
      return Left('An error occurred: ${e.toString()}');
    }
  }

  @override
  Future<String> updateAppointmentStatus(
      String appointmentId, String status) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentId)
          .update({'status': status});
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> updateAppointment(AppointmentModel appointment) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointment.id)
          .update(appointment.toJson());
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }
}
