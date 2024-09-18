import 'dart:io';

import 'package:book_doc/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/models/user_dto.dart';
import '../entities/user.dart';

class ProfileUseCases {
  final _profileRepository = sl.get<ProfileRepository>();

  Future<String> uploadProfileImageToFireStorage(File? pickedImage) async {
    return await _profileRepository
        .uploadProfileImageToFireStorage(pickedImage);
  }

  Future<String> addUserToFireStore(MyUserDTO user) async {
    return await _profileRepository.addUserToFireStore(user);
  }

  Future<Either<String, MyUser>> getUserById(String id) async {
    return await _profileRepository.getUserById(id);
  }

  Future<String> updateUserData(MyUser user) async {
    return await _profileRepository.updateUserData(user);
  }
}
