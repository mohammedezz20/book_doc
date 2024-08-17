import 'dart:io';

import 'package:book_doc/features/profile/data/models/user_dto.dart';
import 'package:book_doc/features/profile/domain/use_cases/profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/helpers/pick_image.dart';
import 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileStates> {
  CompleteProfileCubit() : super(CompleteProfileInitialState());

  static CompleteProfileCubit get(context) => BlocProvider.of(context);
  final _profileUseCase = sl.get<ProfileUseCases>();

  File? pickedImage;
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var ageController = TextEditingController();
  var addressController = TextEditingController();
  String? whatAppNumber;
  String? email;
  String? password;
  String? gender = 'Male';
  String? imageUrl;

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

  changePhoneNumber(phone) {
    whatAppNumber = phone.toString();
    emit(ChangePhoneNumberState());
  }

  changeGender(String value) {
    gender = value;
    emit(ChangeGenderState());
  }

  completeProfile() async {
    emit(CompleteProfileLoadingState());
    String imageResponse =
        await _profileUseCase.uploadProfileImageToFireStorage(pickedImage);
    if (imageResponse == 'error') {
      emit(CompleteProfileErrorState(
          errorMessage: 'Error while uploading image!'));
    } else {
      imageUrl = imageResponse;
      MyUserDTO user = MyUserDTO(
          fullName: fullNameController.text,
          phone: whatAppNumber,
          address: addressController.text,
          age: int.parse(ageController.text),
          email: email,
          password: password,
          gender: gender,
          imageUrl: imageUrl);
      String response = await _profileUseCase.addUserToFireStore(user);
      if (response == 'error') {
        emit(CompleteProfileErrorState(
            errorMessage: 'Error while adding user!'));
      } else {
        emit(CompleteProfileSuccessState());
        fullNameController.clear();
        ageController.clear();
        addressController.clear();
        whatAppNumber = null;
        email = null;
        password = null;
        gender = 'Male';
        imageUrl = null;
        pickedImage = null;
      }
    }
  }
}
