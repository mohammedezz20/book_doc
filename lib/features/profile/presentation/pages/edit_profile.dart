import 'package:book_doc/core/widgets/custom_cached_network_image.dart';
import 'package:book_doc/features/profile/presentation/cubit/edit-profile/edit_profile_cubit.dart';
import 'package:book_doc/features/profile/presentation/cubit/edit-profile/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/phone_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = EditProfileCubit.get(context);
    return BlocConsumer<EditProfileCubit, EditProfileStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Personal Information',
                  style: TextStyles.font18DarkBlueBold,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                              radius: 60.r,
                              backgroundColor: Colors.white,
                              child: cubit.pickedImage != null
                                  ? Image.file(cubit.pickedImage!)
                                  : cubit.imageUrl.isNotEmpty
                                      ? CustomCachedNetworkImage(
                                          imageUrl: cubit.imageUrl)
                                      : null),
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
                          ),
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
                        controller: cubit.whatsAppNumberController,
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller: cubit.passwordController,
                        hintText: 'Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid password!';
                          }
                        },
                        onTapOutside: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                        isObscureText: cubit.isObscure,
                        suffixIcon: IconButton(
                            onPressed: () {
                              cubit.showPassword();
                            },
                            icon: !cubit.isObscure
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined)),
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
                      verticalSpace(30),
                      state is EditProfileLoadingState
                          ? const CircularProgressIndicator(
                              color: ColorsManager.mainBlue,
                            )
                          : AppTextButton(
                              buttonText: 'Save',
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () {
                                cubit.editUserData();
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is EditProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        } else if (state is EditProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully.'),
            ),
          );
          Future.delayed(const Duration(seconds: 2)).then((value) {
            Navigator.pop(context);
          });
        }
      },
    );
  }
}
