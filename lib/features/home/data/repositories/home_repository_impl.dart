import 'package:book_doc/features/home/data/data_sources/home_firebase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/doctor_dto.dart';

class HomeRepositoryImpl implements HomeRepository {
  var homeFirebase = sl.get<HomeFirebase>();

  @override
  Future<Either<String, List<DoctorDTO>>> getDoctors() async {
    return await homeFirebase.getDoctors();
  } // <Doctor>
}
