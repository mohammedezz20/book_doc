import 'dart:developer';
import 'dart:io';

import 'package:book_doc/features/profile/data/models/user_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ProfileFirebase {
  Future<String> uploadProfileImageToFireStorage(File? pickedImage);

  Future<String> addUserToFireStore(MyUserDTO user);
}

class ProfileFirebaseImpl implements ProfileFirebase {
  @override
  Future<String> uploadProfileImageToFireStorage(File? pickedImage) async {
    String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref()
          .child('profile images/$fileName')
          .putFile(pickedImage!);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }

  @override
  Future<String> addUserToFireStore(MyUserDTO user) async {
    try {
      final credential = FirebaseAuth.instance.currentUser;
      await credential!.updateDisplayName(user.fullName);
      await credential.updatePhotoURL(user.imageUrl);

      user.id = credential.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.uid)
          .set(user.toJson());
      return "success";
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }
}
