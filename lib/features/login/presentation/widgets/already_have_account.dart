import 'package:book_doc/generated/l10n.dart';
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
          S.of(context).Already_have_an_account,
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
            S.of(context).Sign_in,
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
