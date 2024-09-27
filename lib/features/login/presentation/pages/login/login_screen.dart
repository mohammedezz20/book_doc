import 'package:book_doc/core/assets/vectors/vectors.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/core/widgets/app_text_field.dart';
import 'package:book_doc/features/login/presentation/pages/forget-password/forget_password_screen.dart';
import 'package:book_doc/features/profile/presentation/pages/complete-profile/fill_your_profile.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/shared/global-variables.dart';
import '../../../../../core/theme/app_fonts.dart';
import '../../../../app-layout/presentation/pages/app_layout.dart';
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
              builder: (context, state) => Column(
                children: [
                  verticalSpace(50),
                  const WelcomeText(),
                  verticalSpace(40),
                  AppTextFormField(
                    controller: cubit.emailController,
                    hintText: S.of(context).Email,
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
                    hintText: S.of(context).Password,
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
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).Forget_Password,
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
                          buttonText: S.of(context).Login,
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {
                            cubit.login();
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
              listener: (context, state) async {
                if (state is LoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                } else if (state is LoginSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).Signed_in_successfully),
                    ),
                  );
                  GlobalVariables.user = FirebaseAuth.instance.currentUser;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppLayout(),
                    ),
                  );
                } else if (state is CompleteGoogleAccountState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FillYourProfile(
                        email: state.user.email!,
                        password: state.user.uid,
                      ),
                    ),
                  );
                }
                {
                  const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
