import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/appointment_model.dart';

abstract class AppointmentFirebase {
  Future<String> addAppointment(AppointmentModel appointment);
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
      log({'errorrrrrrrrrrrrrrrrrrrrrrrrrrrr': e}.toString());
      return e.toString();
    }
  }
}
