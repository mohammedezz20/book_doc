import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'package:book_doc/features/app-layout/presentation/cubit/app_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppLayoutCubit.get(context);
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: ColorsManager.darkBlue,
              unselectedItemColor: ColorsManager.darkBlue,
              items: cubit.bottomNavItems,
              onTap: cubit.changeSelectedIndex,
              currentIndex: cubit.selectedIndex,
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: cubit.screens[cubit.selectedIndex]),
          ),
        );
      },
    );
  }
}
