import 'package:book_doc/features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'package:book_doc/features/app-layout/presentation/pages/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDoc extends StatelessWidget {
  const BookDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Book Doc',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => AppLayoutCubit(),
          child: const AppLayout(),
        ),
      ),
    );
  }
}
