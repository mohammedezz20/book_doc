import 'dart:developer';

import 'package:book_doc/core/assets/images/images.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/widgets/phone_text_field.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_state.dart';
import 'package:book_doc/features/profile/presentation/widgets/fill_your_profile_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_fonts.dart';
import '../../../../../core/widgets/DropDownList.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../app-layout/presentation/pages/app_layout.dart';

class FillYourProfile extends StatelessWidget {
  const FillYourProfile(
      {super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    var cubit = CompleteProfileCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<CompleteProfileCubit, CompleteProfileStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      verticalSpace(50),
                      const FillYourProfileText(),
                      verticalSpace(40),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60.r,
                            backgroundColor: Colors.white,
                            backgroundImage: cubit.pickedImage == null
                                ? AssetImage(AppImages.profile)
                                : FileImage(cubit.pickedImage!),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          cubit.pickImageFromCamera();
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 40,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          cubit.pickImageFromGallery();
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.photo_library_outlined,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15.r,
                              backgroundColor: ColorsManager.moreLighterGray,
                              child: Icon(
                                Icons.edit_outlined,
                                color: ColorsManager.mainBlue,
                                size: 14.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                      verticalSpace(20),
                      AppTextFormField(
                        controller: cubit.fullNameController,
                        hintText: 'Full Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                        },
                        onTapOutside: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      verticalSpace(16),
                      CustomPhoneTextField(
                        onChanged: (phoneNumber) {
                          log(phoneNumber.number.toString());
                          cubit.changePhoneNumber(phoneNumber.number);
                        },
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller: cubit.ageController,
                        keyboardType: TextInputType.number,
                        hintText: 'Age',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your age!';
                          }
                        },
                        onTapOutside: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller: cubit.addressController,
                        hintText: 'Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address!';
                          }
                        },
                        onTapOutside: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      verticalSpace(16),
                      DropDownList(
                        value: cubit.gender,
                        onChanged: (value) {
                          cubit.changeGender(value!);
                        },
                        items: <String>['Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      verticalSpace(30),
                      state is CompleteProfileLoadingState
                          ? const CircularProgressIndicator(
                              color: ColorsManager.mainBlue,
                            )
                          : AppTextButton(
                              buttonText: 'Submit',
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.email = email;
                                  cubit.password = password;
                                  cubit.completeProfile();
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is CompleteProfileSuccessState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AppLayout(),
                ),
              );
            } else if (state is CompleteProfileErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
