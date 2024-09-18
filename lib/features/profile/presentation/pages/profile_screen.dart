import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/profile/presentation/cubit/edit-profile/edit_profile_cubit.dart';
import 'package:book_doc/features/profile/presentation/pages/edit_profile.dart';
import 'package:book_doc/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:book_doc/features/profile/presentation/widgets/profile_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/vectors/vectors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 192.h,
            color: ColorsManager.mainBlue,
            alignment: Alignment.topCenter,
            child: const ProfileAppBar(),
          ),
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: const ProfileBodyWidget(),
          ),
          verticalSpace(20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => EditProfileCubit()..getUserData(),
                    child: const EditProfileScreen(),
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppVector.personalInfo,
                    height: 40.h,
                    width: 40.h,
                  ),
                  horizontalSpace(20),
                  Text(
                    'Personal Information',
                    style:
                        TextStyles.font14DarkBlueBold.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
