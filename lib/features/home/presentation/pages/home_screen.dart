import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:book_doc/features/home/presentation/widgets/recommendation_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';
import '../widgets/category_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDoctors(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                Text(
                  'Hi, ${FirebaseAuth.instance.currentUser!.displayName!} !',
                  style: TextStyles.font18DarkBlueBold,
                ),
                verticalSpace(20),
                const CategoryList(),
                verticalSpace(20),
                const Expanded(child: RecommendationList()),
              ],
            ),
          );
        },
      ),
    );
  }
}
