import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../../home/domain/entities/doctor.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/search_firebase.dart';

class SearchRepositoryImpl implements SearchRepository {
  final _searchFirebase = sl.get<SearchFirebase>();

  @override
  Future<Either<String, List<Doctor>>> searchForDoctors(String searchTerm) {
    return _searchFirebase.searchForDoctors(searchTerm);
  }
}
