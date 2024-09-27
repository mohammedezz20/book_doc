import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_fonts.dart';

class DoctorDetailsTabListWidget extends StatelessWidget {
  final Widget aboutContent;
  final Widget locationContent;
  final Widget reviewsContent;

  const DoctorDetailsTabListWidget({
    super.key,
    required this.aboutContent,
    required this.locationContent,
    required this.reviewsContent,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: ColorsManager.mainBlue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorsManager.mainBlue,
            tabs: [
              Tab(
                text: S.of(context).About,
              ),
              Tab(text: S.of(context).Location),
              Tab(text: S.of(context).Reviews),
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
