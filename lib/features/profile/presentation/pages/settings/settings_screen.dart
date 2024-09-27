import 'package:book_doc/core/assets/vectors/vectors.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/login/presentation/pages/auth_state.dart';
import 'package:book_doc/features/profile/presentation/cubit/setting/setting_cubit.dart';
import 'package:book_doc/features/profile/presentation/cubit/setting/setting_state.dart';
import 'package:book_doc/features/profile/presentation/pages/language/language_screen.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SettingCubit.get(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).Settings,
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
          body: BlocListener<SettingCubit, SettingStates>(
            child: Padding(
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
                          S.of(context).Language,
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
                            S.of(context).Logout,
                            style: TextStyles.font16DarkBlueMedium,
                          ),
                          backgroundColor: Colors.white,
                          content: Text(
                            S.of(context).Are_you_sure_you_want_to_logout,
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
                                  child: Text(S.of(context).Cancel,
                                      style: TextStyles.font16DarkBlueMedium
                                          .copyWith(
                                              color: ColorsManager.mainBlue)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    cubit.signOut();
                                    // await FirebaseAuth.instance.signOut();
                                    // GoogleSignIn googleSignIn = GoogleSignIn();
                                    // if (await googleSignIn.isSignedIn()) {
                                    //   await googleSignIn.signOut();
                                    //   FirebaseAuth.instance.currentUser!
                                    //       .reload();
                                    // }
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const AuthState(),
                                    //   ),
                                    // );
                                  },
                                  child: Text(
                                    S.of(context).Logout,
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
                          S.of(context).Logout,
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
            listener: (context, state) {
              if (state is SignOutErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              } else if (state is SignOutSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).Signed_out_successfully),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthState(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
