import 'package:book_doc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_fonts.dart';

class TabListWidget extends StatelessWidget {
  final Widget aboutContent;
  final Widget locationContent;
  final Widget reviewsContent;

  const TabListWidget({
    super.key,
    required this.aboutContent,
    required this.locationContent,
    required this.reviewsContent,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Column(
        children: [
          // Tab bar
          TabBar(
            labelColor: ColorsManager.mainBlue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorsManager.mainBlue,
            tabs: const [
              Tab(
                text: 'About',
              ),
              Tab(text: 'Location'),
              Tab(text: 'Reviews'),
            ],
            labelStyle: TextStyles.font16WhiteSemiBold
                .copyWith(color: ColorsManager.gray),
          ),
          // Tab bar view
          Expanded(
            child: TabBarView(
              children: [
                aboutContent,
                locationContent,
                reviewsContent,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
