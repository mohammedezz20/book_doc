import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_fonts.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'By logging, you agree to our ',
              style: TextStyles.font12GrayRegular),
          TextSpan(
              text: 'Terms & Conditions',
              style: TextStyles.font12DarkBlueRegular),
          TextSpan(text: ' and ', style: TextStyles.font12GrayRegular),
          TextSpan(
              text: 'Privacy Policy.', style: TextStyles.font12DarkBlueRegular),
        ],
        style: TextStyle(height: 1.5.h),
      ),
      textAlign: TextAlign.center,
    );
  }
}
