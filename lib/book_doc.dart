import 'dart:developer';

import 'package:book_doc/features/home/presentation/cubit/home/home_cubit.dart';
import 'package:book_doc/features/login/presentation/cubit/signup/sign_up_cubit.dart';
import 'package:book_doc/features/login/presentation/pages/auth_state.dart';
import 'package:book_doc/features/profile/presentation/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:book_doc/features/profile/presentation/cubit/language/language_cubit.dart';
import 'package:book_doc/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import 'features/login/presentation/cubit/login/login_cubit.dart';

class BookDoc extends StatelessWidget {
  const BookDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LanguageCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => SignUpCubit()),
          BlocProvider(create: (context) => AppLayoutCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => AppointmentCubit()),
          BlocProvider(create: (context) => CompleteProfileCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (BuildContext context, Locale state) {
            log(state.toString());
            return MaterialApp(
              locale: state,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              title: 'Book Doc',
              debugShowCheckedModeBanner: false,
              home: const AuthState(),
            );
          },
        ),
      ),
    );
  }
}
