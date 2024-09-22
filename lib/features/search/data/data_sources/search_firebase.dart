import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../home/data/models/doctor_dto.dart';
import '../../../home/domain/entities/doctor.dart';

abstract class SearchFirebase {
  Future<Either<String, List<Doctor>>> searchForDoctors(String searchTerm);
}

class SearchFirebaseImpl implements SearchFirebase {
  @override
  Future<Either<String, List<Doctor>>> searchForDoctors(
      String searchQuery) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('doctors')
              .where('name', isGreaterThanOrEqualTo: searchQuery)
              .where('name', isLessThanOrEqualTo: '$searchQuery\uf8ff')
              .get();

      List<Doctor> doctors = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return DoctorDTO.fromJson(data);
      }).toList();

      return Right(doctors);
    } on FirebaseException catch (e) {
      return Left('Failed to fetch doctors: ${e.message}');
    } catch (e) {
      return Left('An error occurred: ${e.toString()}');
    }
  }
}
