import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/step_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepsList extends StatelessWidget {
  const StepsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepWidget(
          number: '1',
          stepName: 'Date & Time',
        ),
        Container(
          color: ColorsManager.lighterGray,
          height: 3,
          width: 100.w,
        ),
        StepWidget(
          number: '2',
          stepName: 'Summary',
          color: ColorsManager.lighterGray,
        ),
      ],
    );
  }
}
