import 'package:book_doc/features/login/presentation/cubit/signup/sign_up_cubit.dart';
import 'package:book_doc/features/login/presentation/pages/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_fonts.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account yet? ',
          style: TextStyles.font12DarkBlueRegular,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => SignUpCubit(),
                  child: const SignUpScreen(),
                ),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
