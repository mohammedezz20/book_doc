import 'dart:io';

import 'package:book_doc/features/profile/data/data_sources/profile_firebase.dart';

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
}
