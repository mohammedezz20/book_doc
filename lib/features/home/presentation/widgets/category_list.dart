import 'package:book_doc/core/assets/images/images.dart';
import 'package:book_doc/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';
import '../pages/category_screen.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
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
      }
    ];
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Doctor Speciality',
            style: TextStyles.font18DarkBlueSemiBold,
          ),
          trailing: InkWell(
            onTap: () {
              // TODO: Get Doctor Speciality.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
            child: Text(
              'See All',
              style: TextStyles.font12BlueRegular,
            ),
          ),
        ),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (index) {
            return CategoryItem(
              categoryName: items[index]['categoryName']!,
              categoryImage: items[index]['categoryImage']!,
            );
          }),
        ),
      ],
    );
  }
}
