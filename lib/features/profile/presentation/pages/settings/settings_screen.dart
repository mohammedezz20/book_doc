import 'package:book_doc/core/assets/vectors/vectors.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/login/presentation/pages/auth_state.dart';
import 'package:book_doc/features/profile/presentation/pages/language/language_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
              style: TextStyles.font18DarkBlueBold,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguageScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.translate_outlined,
                        size: 20.r,
                      ),
                      horizontalSpace(20),
                      Text(
                        'Language',
                        style: TextStyles.font16DarkBlueMedium,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.r,
                      ),
                    ],
                  ),
                ),
                verticalSpace(12),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey[300],
                ),
                verticalSpace(20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Logout',
                          style: TextStyles.font16DarkBlueMedium,
                        ),
                        backgroundColor: Colors.white,
                        content: Text(
                          'Are you sure you want to logout?',
                          style: TextStyles.font12DarkBlueRegular,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                    style: TextStyles.font16DarkBlueMedium
                                        .copyWith(
                                            color: ColorsManager.mainBlue)),
                              ),
                              TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AuthState(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyles.font16DarkBlueMedium
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppVector.logout),
                      horizontalSpace(20),
                      Text(
                        'Logout',
                        style: TextStyles.font16DarkBlueMedium,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.r,
                      ),
                    ],
                  ),
                ),
                verticalSpace(12),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
