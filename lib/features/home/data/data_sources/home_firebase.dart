import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/doctor_dto.dart';

abstract class HomeFirebase {
  Future<Either<String, List<DoctorDTO>>> getDoctors();
}

class HomeFirebaseImpl implements HomeFirebase {
  @override
  Future<Either<String, List<DoctorDTO>>> getDoctors() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('doctors').get();
      List<DoctorDTO> doctors = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return DoctorDTO.fromJson(data);
      }).toList();
      return Right(doctors);
    } on FirebaseException catch (e) {
      log('Firebase Exception: ${e.message}', error: e);
      return Left('Failed to fetch doctors: ${e.message}');
    } catch (e) {
      log('General Exception: $e', error: e);
      return Left('An error occurred: ${e.toString()}');
    }
  }
}
