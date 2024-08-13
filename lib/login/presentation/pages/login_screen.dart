import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/core/widgets/app_text_field.dart';
import 'package:book_doc/login/presentation/cubit/login_cubit.dart';
import 'package:book_doc/login/presentation/cubit/login_state.dart';
import 'package:book_doc/login/presentation/widgets/already_have_account.dart';
import 'package:book_doc/login/presentation/widgets/terms&conditons_text.dart';
import 'package:book_doc/login/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) => Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    verticalSpace(50),
                    const WelcomeText(),
                    verticalSpace(40),
                    AppTextFormField(
                        controller: cubit.emailController,
                        hintText: 'Email',
                        validator: (value) {}),
                    verticalSpace(16),
                    AppTextFormField(
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      validator: (value) {},
                      isObscureText: cubit.isObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            cubit.showPassword();
                          },
                          icon: !cubit.isObscure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    verticalSpace(16),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {},
                    ),
                    verticalSpace(100),
                    const TermsAndConditionsText(),
                    verticalSpace(25),
                    const AlreadyHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
