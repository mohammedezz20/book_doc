import 'package:flutter/material.dart';

import '../../../core/theme/app_fonts.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account yet? ',
          style: TextStyles.font12DarkBlueRegular,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
