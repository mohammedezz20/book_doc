import 'dart:developer';
import 'dart:io';

import 'package:book_doc/features/profile/presentation/cubit/edit-profile/edit_profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/helpers/pick_image.dart';
import '../../../data/models/user_dto.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/profile_usecase.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitialState());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  final _profileUseCase = sl.get<ProfileUseCases>();

  File? pickedImage;
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var ageController = TextEditingController();
  var addressController = TextEditingController();
  var whatsAppNumberController = TextEditingController();
  var passwordController = TextEditingController();

  // String? whatAppNumber;
  String? email;
  String? password;
  String? gender = 'Male';
  String imageUrl = '';
  bool isObscure = true;

  void showPassword() {
    isObscure = !isObscure;
    emit(ShowPasswordState());
  }

  initializeData(MyUser user) {
    fullNameController.text = user.fullName!;
    ageController.text = user.age.toString();
    addressController.text = user.address!;
    whatsAppNumberController.text = user.phone!;
    // whatAppNumber = user.phone;
    email = user.email;
    passwordController.text = user.password!;
    gender = user.gender;
    imageUrl = user.imageUrl!;
  }

  getUserData() async {
    var response = await _profileUseCase
        .getUserById(FirebaseAuth.instance.currentUser!.uid);
    response.fold((l) {
      log(l.toString());
      emit(GetUserDataErrorState(errorMessage: l));
    }, (r) {
      initializeData(r);
      emit(GetUserDataSuccessState());
    });
  }

  void pickImageFromGallery() async {
    File? temp = await ImageUtil.galleryImage();
    if (temp != null) {
      pickedImage = temp;
      emit(PickImageSuccessState());
    } else {
      emit(PickImageErrorState());
    }
  }

  void pickImageFromCamera() async {
    File? temp = await ImageUtil.cameraImage();
    if (temp != null) {
      pickedImage = temp;
      emit(PickImageSuccessState());
    } else {
      emit(PickImageErrorState());
    }
  }

  Future<void> editUserData() async {
    emit(EditProfileLoadingState());
    try {
      if (imageUrl.isEmpty) {
        String imageResponse =
            await _profileUseCase.uploadProfileImageToFireStorage(pickedImage);
        if (imageResponse == 'error') {
          emit(EditProfileErrorState(
              errorMessage: 'Error while uploading image!'));
          return; // Exit early on error
        }
        imageUrl = imageResponse;
      }

      int? age;
      try {
        age = int.parse(ageController.text);
      } catch (e) {
        emit(EditProfileErrorState(errorMessage: 'Invalid age format!'));
        return; // Exit early on error
      }

      MyUserDTO user = MyUserDTO(
        fullName: fullNameController.text.trim(),
        phone: whatsAppNumberController.text.trim(),
        address: addressController.text.trim(),
        age: age,
        email: email!.trim(),
        password: passwordController.text.trim(),
        gender: gender,
        imageUrl: imageUrl,
        id: FirebaseAuth.instance.currentUser!.uid,
      );
      String response = await _profileUseCase.updateUserData(user);
      if (response == 'success') {
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(fullNameController.text.trim());
        FirebaseAuth.instance.currentUser!.updatePhotoURL(imageUrl);
        emit(EditProfileSuccessState());
      } else {
        emit(EditProfileErrorState(
            errorMessage: 'Error while updating user data!'));
      }
    } catch (e) {
      log(e.toString());
      emit(EditProfileErrorState(errorMessage: e.toString()));
    }
  }
}
