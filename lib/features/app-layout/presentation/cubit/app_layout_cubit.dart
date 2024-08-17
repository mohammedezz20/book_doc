import 'package:book_doc/core/assets/images/images.dart';
import 'package:book_doc/features/appointments/presentation/pages/my_appointments_screen.dart';
import 'package:book_doc/features/home/presentation/pages/home_screen.dart';
import 'package:book_doc/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/presentation/pages/seach_screen.dart';
import 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitial());

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppImages.home)), label: 'Home'),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppImages.search)), label: 'Search'),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppImages.calendar)), label: 'Appointments'),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppImages.user)), label: 'Profile'),
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MyAppointmentsScreen(),
    const ProfileScreen(),
  ];

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
