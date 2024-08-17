import 'package:book_doc/core/assets/vectors/vectors.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/core/widgets/app_text_field.dart';
import 'package:book_doc/features/login/presentation/pages/forget-password/forget_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_fonts.dart';
import '../../cubit/login/login_cubit.dart';
import '../../cubit/login/login_state.dart';
import '../../widgets/dont_have_account_text.dart';
import '../../widgets/sign_in_divider.dart';
import '../../widgets/terms&conditons_text.dart';
import '../../widgets/welcome_text.dart';

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
                if (state is LoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                } else if (state is LoginSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Signed in successfully'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Center(
                          child: Text(
                              'Home Screen ${FirebaseAuth.instance.currentUser?.displayName}'),
                        ),
                      ),
                    ),
                  );
                } else {
                  const Center(child: CircularProgressIndicator());
                }
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid email!';
                        }
                      },
                      onTapOutside: (p0) {
                        FocusScope.of(context).unfocus();
                      },
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
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => LoginCubit(),
                                child: const ForgetPasswordScreen(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    state is LoginLoadingState
                        ? const CircularProgressIndicator(
                            color: ColorsManager.mainBlue,
                          )
                        : AppTextButton(
                            buttonText: 'Login',
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.login();
                              }
                            },
                          ),
                    verticalSpace(40),
                    const SignInDivider(),
                    verticalSpace(40),
                    GestureDetector(
                        onTap: () {
                          cubit.signInWithGoogle();
                        },
                        child: SvgPicture.asset(AppVector.google)),
                    verticalSpace(40),
                    const TermsAndConditionsText(),
                    verticalSpace(25),
                    const DontHaveAccountText(),
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
