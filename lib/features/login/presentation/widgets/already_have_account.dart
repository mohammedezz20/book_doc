import 'package:flutter/material.dart';

import '../../../../core/theme/app_fonts.dart';
import '../pages/login/login_screen.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyles.font12DarkBlueRegular,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Text(
            'Sign in',
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
