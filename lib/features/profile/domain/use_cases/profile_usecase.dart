import 'dart:io';

import 'package:book_doc/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/models/user_dto.dart';

class ProfileUseCases {
  final _profileRepository = sl.get<ProfileRepository>();

  Future<String> uploadProfileImageToFireStorage(File? pickedImage) async {
    return await _profileRepository
        .uploadProfileImageToFireStorage(pickedImage);
  }

  Future<String> addUserToFireStore(MyUserDTO user) async {
    return await _profileRepository.addUserToFireStore(user);
  }
}
