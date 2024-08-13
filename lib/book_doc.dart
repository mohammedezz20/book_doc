import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        home: Scaffold(
          body: Text('Book Doc'),
        ),
      ),
    );
  }
}
