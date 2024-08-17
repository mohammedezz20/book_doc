import 'package:book_doc/core/assets/images/images.dart';
import 'package:book_doc/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) {
        return CategoryItem(
          categoryName: items[index]['categoryName']!,
          categoryImage: items[index]['categoryImage']!,
        );
      }),
    );
  }
}
