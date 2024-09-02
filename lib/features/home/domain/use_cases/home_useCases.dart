import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/models/doctor_dto.dart';
import '../repositories/home_repository.dart';

class HomeUseCases {
  var homeRepository = sl.get<HomeRepository>();

  Future<Either<String, List<DoctorDTO>>> getDoctors() async {
    return await homeRepository.getDoctors();
  }
}
