import 'package:dartz/dartz.dart';

import '../../data/models/doctor_dto.dart';

abstract class HomeRepository {
  Future<Either<String, List<DoctorDTO>>> getDoctors();
}
