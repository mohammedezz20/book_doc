import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../../home/domain/entities/doctor.dart';
import '../repositories/search_repository.dart';

class SearchUseCases {
  final _searchRepository = sl.get<SearchRepository>();

  Future<Either<String, List<Doctor>>> searchForDoctors(String searchTerm) {
    return _searchRepository.searchForDoctors(searchTerm);
  }
}
