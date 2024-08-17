import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/login/presentation/pages/auth_state.dart';

class BookDoc extends StatelessWidget {
  const BookDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Book Doc',
        debugShowCheckedModeBanner: false,
        home: AuthState(),
      ),
    );
  }
}
