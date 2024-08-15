import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(6),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
