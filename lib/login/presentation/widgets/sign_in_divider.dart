import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.0.h,
            color: ColorsManager.lighterGray,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Text(
            'or sign in with',
            style: TextStyles.font12GrayRegular,
          ),
        ),
        Expanded(
          child: Container(
            height: 1.0,
            color: ColorsManager.lighterGray,
          ),
        ),
      ],
    );
  }
}
