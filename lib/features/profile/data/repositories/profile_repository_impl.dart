import 'dart:io';

import 'package:book_doc/features/profile/data/data_sources/profile_firebase.dart';
import 'package:book_doc/features/profile/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/user_dto.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final _profileFirebase = sl.get<ProfileFirebase>();

  @override
  Future<String> uploadProfileImageToFireStorage(File? pickedImage) {
    return _profileFirebase.uploadProfileImageToFireStorage(pickedImage);
  }

  @override
  Future<String> addUserToFireStore(MyUserDTO user) {
    return _profileFirebase.addUserToFireStore(user);
  }

  @override
  Future<Either<String, MyUser>> getUserById(String id) {
    return _profileFirebase.getUserById(id);
  }

  @override
  Future<String> updateUserData(MyUser user) {
    return _profileFirebase.updateUserData(user);
  }
}
