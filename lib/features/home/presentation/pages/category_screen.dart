import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets/images/images.dart';
import '../../../../core/theme/app_fonts.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  List<Map<String, String>> items = [
    {
      'categoryName': 'General',
      'categoryImage': AppImages.generalCategory,
    },
    {
      'categoryName': 'Nephrology',
      'categoryImage': AppImages.nephrologyCategory,
    },
    {
      'categoryName': 'Neurologic',
      'categoryImage': AppImages.neurologyCategory,
    },
    {
      'categoryName': 'Pediatric',
      'categoryImage': AppImages.pediatricsCategory,
    },
    {
      'categoryName': 'General',
      'categoryImage': AppImages.generalCategory,
    },
    {
      'categoryName': 'Nephrology',
      'categoryImage': AppImages.nephrologyCategory,
    },
    {
      'categoryName': 'Neurologic',
      'categoryImage': AppImages.neurologyCategory,
    },
    {
      'categoryName': 'Pediatric',
      'categoryImage': AppImages.pediatricsCategory,
    },
    {
      'categoryName': 'General',
      'categoryImage': AppImages.generalCategory,
    },
    {
      'categoryName': 'Nephrology',
      'categoryImage': AppImages.nephrologyCategory,
    },
    {
      'categoryName': 'Neurologic',
      'categoryImage': AppImages.neurologyCategory,
    },
    {
      'categoryName': 'Pediatric',
      'categoryImage': AppImages.pediatricsCategory,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).Doctor_Speciality,
              style: TextStyles.font18DarkBlueBold,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) => CategoryItem(
                      categoryName: items[index]['categoryName']!,
                      categoryImage: items[index]['categoryImage']!,
                    ),
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.5.w,
                      crossAxisSpacing: 2.5.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
