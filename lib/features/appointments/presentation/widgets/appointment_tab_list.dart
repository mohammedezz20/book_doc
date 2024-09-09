import 'package:book_doc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_fonts.dart';

class AppointmentTabList extends StatelessWidget {
  final Widget upcomingContent;
  final Widget completedContent;
  final Widget cancelledContent;

  const AppointmentTabList({
    super.key,
    required this.upcomingContent,
    required this.completedContent,
    required this.cancelledContent,
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
            tabs: const [
              Tab(
                text: 'Upcoming',
              ),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
            labelStyle: TextStyles.font16WhiteSemiBold
                .copyWith(color: ColorsManager.gray),
          ),
          // Tab bar view
          Expanded(
            child: TabBarView(
              children: [
                upcomingContent,
                completedContent,
                cancelledContent,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
