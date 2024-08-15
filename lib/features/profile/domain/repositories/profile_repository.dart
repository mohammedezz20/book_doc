import 'dart:io';

import 'package:book_doc/features/profile/data/models/user_dto.dart';

abstract class ProfileRepository {
  Future<String> uploadProfileImageToFireStorage(File? pickedImage);

  Future<String> addUserToFireStore(MyUserDTO user);
}
