import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:book_doc/features/profile/presentation/pages/complete-profile/fill_your_profile.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_fonts.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../cubit/signup/sign_up_cubit.dart';
import '../../cubit/signup/sign_up_state.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/create_account_text.dart';
import '../../widgets/terms&conditons_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SignUpCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SignUpCubit, SignUpStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      verticalSpace(50),
                      const CreateAccountText(),
                      verticalSpace(40),
                      AppTextFormField(
                        controller: cubit.emailController,
                        hintText: S.of(context).Email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email!';
                          }
                          RegExp emailRegex = RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Email should be like a9H5x@example.com';
                          }
                        },
                        onTapOutside: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller: cubit.passwordController,
                        hintText: S.of(context).Password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid password!';
                          } else if (value.length < 8) {
                            return 'Password should be at least 8 characters';
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
                              : const Icon(Icons.visibility_outlined),
                        ),
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        controller: cubit.confirmPasswordController,
                        hintText: S.of(context).Confirm_password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid password!';
                          } else if (cubit.passwordController.text !=
                              cubit.confirmPasswordController.text) {
                            return 'Password does not match!';
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
                              : const Icon(Icons.visibility_outlined),
                        ),
                      ),
                      verticalSpace(30),
                      state is SignUpLoadingState
                          ? const CircularProgressIndicator(
                              color: ColorsManager.mainBlue,
                            )
                          : AppTextButton(
                              buttonText: S.of(context).Create_Account,
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.signUp();
                                }
                              },
                            ),
                      verticalSpace(40),
                      const TermsAndConditionsText(),
                      verticalSpace(25),
                      const AlreadyHaveAccount(),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).Account_created_successfully),
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CompleteProfileCubit(),
                    child: FillYourProfile(
                      email: cubit.emailController.text,
                      password: cubit.passwordController.text,
                    ),
                  ),
                ),
              );
            } else if (state is SignUpErrorState) {
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
