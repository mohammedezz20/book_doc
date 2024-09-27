import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_fonts.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: S.of(context).By_logging_you_agree_to_our,
              style: TextStyles.font12GrayRegular),
          TextSpan(
              text: S.of(context).Terms_Conditions,
              style: TextStyles.font12DarkBlueRegular),
          TextSpan(
              text: S.of(context).and, style: TextStyles.font12GrayRegular),
          TextSpan(
              text: S.of(context).Privacy_Policy,
              style: TextStyles.font12DarkBlueRegular),
        ],
        style: TextStyle(height: 1.5.h),
      ),
      textAlign: TextAlign.center,
    );
  }
}
