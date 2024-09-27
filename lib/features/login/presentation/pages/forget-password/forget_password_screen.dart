import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/core/widgets/app_text_field.dart';
import 'package:book_doc/features/login/presentation/pages/login/login_screen.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../cubit/login/login_cubit.dart';
import '../../cubit/login/login_state.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginStates>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(50),
                        Text(
                          S.of(context).Forget_Password,
                          style: TextStyles.font24BlueBold,
                        ),
                        verticalSpace(6),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: S
                                    .of(context)
                                    .At_our_app_we_take_the_security_of_your_information_seriously,
                                style: TextStyles.font14GrayRegular
                                    .copyWith(height: 1.5.h),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(40),
                        AppTextFormField(
                            controller: cubit.emailController,
                            hintText: S.of(context).Email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              }
                            }),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                  ),
                  SliverToBoxAdapter(
                    child: state is ForgetPasswordLoadingState
                        ? Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator())
                        : AppTextButton(
                            buttonText: S.of(context).Reset_Password,
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () {
                              cubit.forgetPassword();
                            }),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is SubmitPasswordResetSuccessState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        S.of(context).Password_Reset,
                        style: TextStyles.font15DarkBlueMedium,
                      ),
                      content: Text(
                        S
                            .of(context)
                            .Check_your_Gmail_inbox_for_password_reset_link,
                        style: TextStyles.font12DarkBlueRegular,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => LoginCubit(),
                                  child: const LoginScreen(),
                                ),
                              ),
                            );
                          },
                          child: Text(S.of(context).OK),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(S.of(context).Cancel),
                        ),
                      ],
                    );
                  });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 5),
                  content: Text(S
                      .of(context)
                      .Check_your_Gmail_inbox_for_password_reset_link),
                ),
              );
            } else if (state is SubmitPasswordResetErrorState) {
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
