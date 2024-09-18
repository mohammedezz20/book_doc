import 'dart:io';

import 'package:book_doc/features/profile/data/models/user_dto.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class ProfileRepository {
  Future<String> uploadProfileImageToFireStorage(File? pickedImage);
  Future<String> addUserToFireStore(MyUserDTO user);

  Future<Either<String, MyUser>> getUserById(String id);

  Future<String> updateUserData(MyUser user);
}
