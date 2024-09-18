import 'package:book_doc/core/widgets/custom_cached_network_image.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';
import '../cubit/complete_profile/complete_profile_state.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileStates>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: -60.h,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Colors.white,
                      child: CustomCachedNetworkImage(
                          imageUrl:
                              FirebaseAuth.instance.currentUser!.photoURL!),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    FirebaseAuth.instance.currentUser!.displayName!,
                    style: TextStyles.font18DarkBlueSemiBold,
                  ),
                  verticalSpace(5),
                  Text(
                    FirebaseAuth.instance.currentUser!.email!,
                    style: TextStyles.font14GrayRegular,
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
