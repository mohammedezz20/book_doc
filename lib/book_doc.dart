import 'package:book_doc/login/presentation/cubit/login_cubit.dart';
import 'package:book_doc/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
