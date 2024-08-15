import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/login/presentation/cubit/login/login_cubit.dart';
import 'features/login/presentation/pages/login/login_screen.dart';

class BookDoc extends StatelessWidget {
  const BookDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Book Doc',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        ),
      ),
    );
  }
}
