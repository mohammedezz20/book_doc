import 'package:book_doc/core/shared/global-variables.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/profile/presentation/cubit/edit-profile/edit_profile_cubit.dart';
import 'package:book_doc/features/profile/presentation/pages/edit_profile.dart';
import 'package:book_doc/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:book_doc/features/profile/presentation/widgets/profile_body_widget.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/vectors/vectors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user;
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
            child: ProfileBodyWidget(
              user: user ?? GlobalVariables.user!,
            ),
          ),
          verticalSpace(20),
          GestureDetector(
            onTap: () async {
              final updatedUser = Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => EditProfileCubit()..getUserData(),
                    child: const EditProfileScreen(),
                  ),
                ),
              );
              user = await updatedUser;
              setState(() {});
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
                    S.of(context).Personal_Information,
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
