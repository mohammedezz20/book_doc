import 'package:dartz/dartz.dart';

import '../../../home/domain/entities/doctor.dart';

abstract class SearchRepository {
  Future<Either<String, List<Doctor>>> searchForDoctors(String searchTerm);
}
