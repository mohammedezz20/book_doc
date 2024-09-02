import 'package:book_doc/core/assets/images/images.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/doctor.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(30),
        Text(
          'About Me',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        verticalSpace(10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${doctor.bio}',
              ),
            ],
            style: TextStyles.font14GrayRegular
                .copyWith(wordSpacing: 2, height: 1.3.h),
          ),
        ),
        verticalSpace(24),
        Text('Working Time', style: TextStyles.font18DarkBlueSemiBold),
        verticalSpace(10),
        Text(
          'Monday - Friday: 9:00 AM - 5:00 PM',
          style: TextStyles.font14GrayRegular,
        ),
        verticalSpace(24),
        Text('Contact Information', style: TextStyles.font18DarkBlueSemiBold),
        verticalSpace(10),
        Row(
          children: [
            Image.asset(
              AppImages.whatsapp,
              width: 20.r,
              height: 20.r,
            ),
            horizontalSpace(8),
            Text(
              '${doctor.phoneNumber}',
              style: TextStyles.font14GrayRegular,
            ),
          ],
        ),
        verticalSpace(24),
        Text('Address', style: TextStyles.font18DarkBlueSemiBold),
        verticalSpace(10),
        Text(
          '${doctor.address}',
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
